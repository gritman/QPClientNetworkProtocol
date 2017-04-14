package cy.suruct {
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;
	import cy.suruct.IServerSuruct;
    
    
    /**
	 * @author huangkan
	 *  客户端设置服务器密码
	 */
    public class PlayerSet implements IServerSuruct {
        
		public static const LIMIT_MASK_IP:int = 1;
		public static const LIMIT_MASK_PASSWORD:int = 2;
		public static const LIMIT_MASK_NETSPEED:int = 4;
		public static const LIMIT_MASK_ESCAPE:int = 8;
		public static const LIMIT_MASK_MIN_SCORE:int = 16;
		public static const LIMIT_MASK_MAX_SCORE:int = 32;
		public static const LIMIT_MASK_MIN_RICH:int = 64;
		public static const LIMIT_MASK_MAX_RICH:int = 128;
		
        /** 限制内容 */
        public var mask : uint;
        
        /** 密码 */
		public var password: String;
        
        public function decode(inputStream: SrsStreamReader, skip:Number=0): void {
            
        }

		public function encode(outputStream: SrsStreamWriter, skip:Number=0): void {
            if(this.password==null) this.mask = 0;
            else this.mask = LIMIT_MASK_PASSWORD;
            outputStream
                .putShort(this.mask)
                .putStr(this.password==null?"":this.password)
                .putInt(0)
                .putInt(0)
                .putLong(0)
                .putLong(0)
                .putLong(0)
                .putLong(0);
        }
    	
    }
}