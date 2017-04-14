package cy {
	import com.hurlant.crypto.Crypto;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.setInterval;
	
	import cmds.NetCommand;
	import cmds.SrsCommand;
	
	import cy.cst.NetAction;
	import cy.suruct.SrsPackage;

	public class SrsServer {
		
		public static var instance:SrsServer;
		public var niceSelect:SrsIp;
		public var ip:String;
		public var port:int;
		protected var heartList:Array;
		protected var socket:Socket;
		protected var connectTime:Number;
		protected var heartIntervalId:int;
		protected var numOutputBytes:int;
		protected var numInputBytes:int;
		
		protected var outputbuff:ByteArray;
		protected var inputbuff:ByteArray;
		
		public function SrsServer(ip:String, port:int){
			this.ip = ip;
			this.port = port;
			this.heartList = [];
		}
		
		/** 连接到服务器 */
		public function connect(): void {
			if (this.socket != null) {
				this.removeListeners();
				if (this.socket.connected) {
					this.socket.close();
				}
				this.socket = null;
			}
			this.socket = new Socket();
			this.addListeners();
			this.connectTime = new Date().getTime();
			this.socket.connect(this.ip,this.port);
		}
		
		public function close():void {
			if (this.socket!=null && this.socket.connected) {
				this.socket.close();
			}
		}
		
		
		protected function addListeners(): void {
			if(this.socket != null) {
				this.socket.addEventListener(Event.CONNECT,this.connectHandler);
				this.socket.addEventListener(IOErrorEvent.IO_ERROR,this.errorHandler);
				this.socket.addEventListener(Event.CLOSE,this.closeHandler);
				this.socket.addEventListener(ProgressEvent.SOCKET_DATA,this.onReciveMessage);
			}
		}
		
		protected function removeListeners(): void {
			if(this.socket != null) {
				this.socket.removeEventListener(Event.CONNECT,this.connectHandler);
				this.socket.removeEventListener(IOErrorEvent.IO_ERROR,this.errorHandler);
				this.socket.removeEventListener(Event.CLOSE,this.closeHandler);
				this.socket.removeEventListener(ProgressEvent.SOCKET_DATA,this.onReciveMessage);
			}
		}
		
		protected function onReciveMessage(event:ProgressEvent):void {
			this.inputbuff = new ByteArray();
			this.socket.readBytes(this.inputbuff);
			this.numInputBytes += this.inputbuff.length;
			
			while (this.inputbuff.bytesAvailable > 0) {
				var srsPack = new SrsPackage();
				srsPack.decode(new SrsStreamReader(this.inputbuff));
				this.recv(srsPack);
			}
		}
		
		protected function closeHandler(event:Event):void {
			trace('socket close');
		}
		
		protected function errorHandler(event:IOErrorEvent):void {
			trace('socket error');
		}
		
		protected function connectHandler(event:Event):void {
			trace('connect success');
			this.heartIntervalId = setInterval(this.onConnectHeart,30000);
			EncryptHelper.init();
			connectCommand(NetAction.SRS_CONNECT);
		}
		
		
		
		protected function onConnectHeart():void {
			var len = this.heartList.length;
			for (var i=0; i<len; ++i) {
//				__SEND_NOTIFICATION(this.heartList[i]);
			}
		}
		
		
		
		/** 发送数据给服务器 */
		public function send(srsPack:SrsPackage):void {
			if (!this.socket.connected) {
//				__SEND_NOTIFICATION(NetAction.SRS_ERROR);
				return;
			}
			this.outputbuff = new ByteArray();
			srsPack.encode(new SrsStreamWriter(this.outputbuff));
			this.socket.writeBytes(this.outputbuff);
			this.socket.flush();
			this.numOutputBytes += this.outputbuff.length;
			SrsLogger.sendLog(srsPack.sXYID,srsPack.sProcessID);
//			this.logpack(this.outputbuff, "send:");
		}
		
		/** 收到数据给发送的数据 */
		protected function recv(srsPack:SrsPackage):void {
//			 this.logpack(this.inputbuff, "recv:");  
			 SrsLogger.recvLog(srsPack.sXYID,srsPack.sProcessID);
			 if (!this.connectCommand(String(srsPack.sXYID),srsPack)) {
				 if(NetAction.PROCESS_PREFIX.indexOf(srsPack.sProcessID)==-1) {
					 exCommand(String(srsPack.sXYID),srsPack);
				 } else {
					 var cmdId = srsPack.sProcessID + NetAction.PROCESS_CUT + srsPack.sXYID;
					 exCommand(cmdId,srsPack);
				 }
			 }
			 
			
		}
		
		/** 打印基础流源数据(用16进制描述2进制字节流) */
		protected function logpack(buff:ByteArray, title:String):void {
			var len: int = buff.length;
			buff.position = 0;
			var hex = new SrsStreamReader(buff).getHex(len);
			trace(title + hex);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		protected var cmdsDepot:Dictionary = new Dictionary();
		public function registerCommand(id:String, netCommand:Class):void {
			this.cmdsDepot[id] = netCommand;
		}
		public function exCommand(id:String, data:*=null):void {
			var SrsCmd:Class = this.cmdsDepot[id];
			if (SrsCmd==null) {
				trace('['+id+']协议未注册');
				return;
			}
			var srsCommand:SrsCommand = new SrsCmd();
			srsCommand.parse(id, data);
		}
		
		
		protected function connectCommand(xyId:String, data:*=null):Boolean {
			
			switch(xyId) {
				//连接成功后，先发送消息1，验证客户端合法性    
				case NetAction.SRS_CONNECT:
					var pack:SrsPackage = new SrsPackage();                
					pack.data.writeUnsignedInt(1);
					pack.sXYID = parseInt(NetAction.CMDT_ENCRYPTVER);
					this.send(pack);
					return true;
					
				//收到连接1号消息回复后，发送3号消息，获取KEY
				case NetAction.CMDT_ENCRYPTVER:
					var pack: SrsPackage = new SrsPackage();
					pack.sXYID = parseInt(NetAction.CMDT_REQKEY);
					this.send(pack);
					return true;
					
				//收到4号消息(3号的回复)，得到KEY，并记录
				case NetAction.CMDT_RESPKEY:
					var pack: SrsPackage = data;
					var cbKeys: ByteArray = new ByteArray();
					var cbLen = pack.data.readByte();
					pack.data.readBytes(cbKeys,0,cbLen);
					
					EncryptHelper.akey = cbKeys;
					this.exCommand(NetAction.CMDT_PLAYERCONNECT);
					return true;
					
			}
			
			return false;
		}
		
		
		public var current:SrsIp;
		public var reConnect:SrsIp;
		protected var srsList:Array;
		public function search(appId:int):SrsIp {
			if (srsList == null) return null;
			var len = srsList.length;
			for (var i=0; i<len; ++i) {
				if (srsList[i].appId == appId) {
					return srsList[i];
				}
			}
			return null;
		}
		public function searchNice():SrsIp {
			niceSelect = srsList[0];
			for (var i=1,len=srsList.length; i<len; ++i) {
				if (srsList[i].load < niceSelect.load) {
					niceSelect = srsList[i];
				}
			}
			return niceSelect;
		}
		
		
		
		
		
		protected var autoAskId:uint = 0;
		protected var askCommandDepot:Object = {};
		public function addAskCmd(value:*):uint {
			++autoAskId;
			askCommandDepot[autoAskId] = value;
			return autoAskId;
		}
		
		public function getAskCmd(askId:uint):* {
			var commandData = askCommandDepot[askId];
			askCommandDepot[askId] = undefined;
			return commandData;
		}
		
		
		
		
		
		
		
	}
}

