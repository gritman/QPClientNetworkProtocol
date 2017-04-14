package cy {
	public class SrsIp {
		public var ip:String;
		public var port:Number;
		public var appId:Number;
		public var load:Number;
		
		public var gameId:Number;
		public var moduleServerId:Number;
		
		public var roomType:Number;
		public var label:String;
		public var notice:String;
		public var mail:String;

		public function SrsIp(appId:Number, ip:String, port:Number,
			gameId:Number, moduleServerId:Number,
			notice:String, mail:String,
			label:String="正式环境",
			roomType:Number=2) {
				
				this.appId = appId;
				this.ip = ip;
				this.port = port;
				
				this.gameId = gameId;
				this.moduleServerId = moduleServerId;
				
				this.label = label;
				this.roomType = roomType;
				
				this.notice = "http://" + notice;
				this.mail = "http://" + mail;
			}
		
	}
}