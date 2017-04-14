package cy.cst {
		/**  客户端定义的房间类型     */
	public class ROOM_TYPE {
		public static const NULL:int = -1;
				/**初级房(未启用) */
		public static const BASIC:int = 0;
			/**中级房*/
		public static const NORMAL:int = 1;
			/**急速房 */
		public static const FAST:int = 2;
			/**私人房 */
		public static const VIP:int = 3;
			/**坐满即玩赛事房*/  
		public static const SNG:int = 4;
			/**多人赛事房(未启用) */
		public static const MTT:int = 5;
			/** 欢乐城房间 */
		public static const HAPPY:int = 6;
	}
}