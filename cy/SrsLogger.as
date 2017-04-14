package cy {
	import cy.cst.NetAction;
    
	public class SrsLogger {
		
		public static const LOG_TYPE_SEND:int = 1;
		public static const LOG_TYPE_RECV:int = 2;
		public static const LOG_TYPE_GS_SEND:int = 4;
		public static const LOG_TYPE_GS_RECV:int = 8;
		public static const LOG_TYPE_ROOM:int = 16;
		public static const LOG_TYPE_UNDEFINE:int = 32;
		public static const LOG_TYPE_ERROR:int = 64;
		
		public static const logMaskConfig:uint = 0
			| LOG_TYPE_SEND  //所有发送的消息号打印
			| LOG_TYPE_RECV  //所有接收的消息号打印
			| LOG_TYPE_GS_SEND //游戏内发送的消息号打印
			| LOG_TYPE_GS_RECV //游戏内接收的消息号打印
			| LOG_TYPE_ROOM //进出房间关键点打印
			| LOG_TYPE_UNDEFINE //没有完成的开发打印提示
			| LOG_TYPE_ERROR //错误提示
		
		
			
			
		public static function log(str:String, id:uint) {
			if (id & logMaskConfig) trace(str);
//			app.debug.log(str);
		}
		
		public static var continuousId:String = "";
		public static var continuousCount:uint = 1;
		public static function recvLog(id:uint,pocs:uint=0):void {
			
			var xyId = (pocs>0 ? pocs+NetAction.PROCESS_CUT : "") + id;
			var notificationId = pocs==11||pocs==12 ? xyId : String(id);
			if (continuousId == xyId) {
				++continuousCount;
			} else {
				var cuntInfo = continuousCount > 1 ? (continuousId + " x" + continuousCount) : "";
				if (cuntInfo != "") log('recv:' + cuntInfo, LOG_TYPE_RECV);
//				if (__HAS_NOTIFICATION(notificationId)) {
					log('recv:' + xyId, LOG_TYPE_RECV);
//				} else {
//					log('recv:' + xyId + " (忽略)", LOG_TYPE_UNDEFINE);
//				}
				continuousId = xyId;
				continuousCount = 1;
			}
		}
		
		public static function sendLog(id:uint,pocs:uint=0):void {
			log('send:' + (pocs>0?(pocs+"-"):"") + id, LOG_TYPE_SEND);
		}
		
		
			
			
	}
        
    

}

