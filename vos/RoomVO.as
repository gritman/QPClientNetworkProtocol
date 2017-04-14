package vos {
	import cy.cst.ROOM_TYPE;

	/** 客户端房间类型对象
	 * 其中各种参数，使用时请注意……
	 * 创建时使用数字(方便与服务端核对，检查)
	 * 而实际逻辑判断时，请使用常量 */
	public class RoomVO {
		
		/** 客户端标识：房间类型，详见RoomProxy.TYPE */ 
		public var type:int;
		/** 客户端标识：是否为私人房  */ 
		public var isVip:Boolean;
		/** 客户端标识：是否可以快速弃牌  */ 
		public var isFast:Boolean;
		
		/** 服务端配置：房间类型，不同的类型进入流程不同，详见RoomProxy.SVR_MODE  */ 
		public var svrMode:int;
		
		/** 在服务端配置的roomId */ 
		public var svrRoomId:int;
		/** 在服务端配置的ofsId */ 
		public var svrOfsId:int;
		
		/** 小盲(欢乐城最小投注) */
		public var smallBlinds: int;
		/** 可以投注筹码量 */
		public var addBlinds:Array;
		/** 大盲(欢乐城最大投注) */
		public var bigBlinds: int;
		/** 最小带入 */ 
		public var minBank: int;
		/** 最大带入 */
		public var maxBank: int;
		/** 欢乐城普通座位带入 */
		public var normalBank:int;
		/** 欢乐城服务费基数 */
		public var service:int;
		
		/** 前注 */
		public var anti:int;
		
		/** 在线人数 */
		public var online:int = 0;
		
		/** 当个房价价格比例 
		 * 当个房间魅力比例
		 * 当个房间魅力积分比例
		 *  当个房间对方魅力比例 
		 * 当个房间对方魅力积分比例
		 */
		public var charmList:Array =[];
		
		
		
		public static function createNormal(smallBlinds: uint, bigBlinds: uint,
											minBank: uint,maxBank: uint,
											ofsId:uint, roomId:uint, 
											svrMode:uint=4, isVip:Boolean=false,anti:uint=0,
											charmList:Array=null):RoomVO {
				var roomVo = new RoomVO();
				roomVo.smallBlinds = smallBlinds;
				roomVo.bigBlinds = bigBlinds;
				roomVo.minBank = minBank;
				roomVo.maxBank = maxBank;
				roomVo.svrOfsId = ofsId;
				roomVo.svrRoomId = roomId;
				roomVo.svrMode = svrMode;
				roomVo.isVip = isVip;
				roomVo.anti = anti;
				roomVo.charmList = charmList||[];
				roomVo.type = isVip ? ROOM_TYPE.VIP : ROOM_TYPE.NORMAL; 
				return roomVo;
			}
	}
}