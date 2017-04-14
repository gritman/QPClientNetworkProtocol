package cy.suruct {
	import flash.utils.ByteArray;
	
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;

	public class ReqPlayerPlusData implements IServerSuruct {
		
		public var userid:String = "";             //平台账号
		public var ptid:String = "";               //盛大通行证
		public var ptnumid:String = "";            //盛大数字账号
		public var nickname:String = "";           //昵称
		public var identity:String = "";           //明文
		
		public var sex:int = 0;                 //性别
		public var head:int = 0;                //头像
		public var right:int = 0;               //权限
		public var regtime:int = 0;             //注册时间
		public var vipid:int = 0;               //会员类型
		public var vipendtime:int = 0;          //vip结束时间
		
		public var ip:int = 0;                  //客户端ip;
		public var osver:int = 0;               //客户端操作系统版本号
		public var clienttype:int = 0;          //客户端类型
		public var elimited:int = 0;
		public var eprotected:int = 0;
		public var protectedurl:String = "";
		public var keylen:int = 0;
		public var key:String = "";
		
		public var bytesCache:ByteArray;
		
		public function encode(outputStream: SrsStreamWriter, skip:Number=0): void {
			outputStream.putStr(userid);
			outputStream.putStr(ptid);
			outputStream.putStr(ptnumid);
			outputStream.putStr(nickname);
			outputStream.putStr(identity);
			outputStream.putByte(sex);
			outputStream.putInt(head);
			outputStream.putInt(right);
			outputStream.putUInt(regtime);
			outputStream.putInt(vipid);
			outputStream.putUInt(vipendtime);
			outputStream.putInt(ip);
			outputStream.putInt(osver);
			outputStream.putInt(clienttype);
//			outputStream.putByte(keylen);
			outputStream.putStr(key);
			outputStream.putInt(elimited);
			outputStream.putInt(eprotected);
			outputStream.putStr(protectedurl);
		}
		
		
		public function decode(inputStream: SrsStreamReader, skip:Number=0): void {
			this.bytesCache = inputStream.stream;
			this.userid = inputStream.getStr();
			this.ptid = inputStream.getStr();
			this.ptnumid = inputStream.getStr();
			this.nickname = inputStream.getStr();
			this.identity =inputStream.getStr();
			this.sex = inputStream.getByte();
			this.head = inputStream.getInt();
			this.right = inputStream.getInt();
			this.regtime = inputStream.getUInt();
			this.vipid = inputStream.getInt();
			this.vipendtime = inputStream.getUInt();
			this.ip = inputStream.getInt();
			this.osver = inputStream.getInt();
			this.clienttype = inputStream.getInt();
			//this.keylen = inputStream.getByte();
			this.key = inputStream.getStr();
			this.keylen = this.key.length;
			this.elimited = inputStream.getInt();
			this.eprotected = inputStream.getInt();
			this.protectedurl = inputStream.getStr();
		}
		
	}
}