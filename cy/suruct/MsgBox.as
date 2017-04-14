package cy.suruct {
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;
    
    /**
	 * @author huangkan
	 *  服务端推送的消息对象
	 */
    public class MsgBox implements IServerSuruct {
        
         public var mtype : Number;
		 public var szCaption: String;
		 public var szText: String;
		 public var dwIconBtn: Number;
		 public var delay: Number;
		 public var color: Number;
		 public var szWeb: String;
		 public var dwAction: Number;
        
        
        public function decode(inputStream: SrsStreamReader, skip:Number=0): void {
            this.mtype = inputStream.getByte();
            this.szCaption = inputStream.getStr();
            this.szText = inputStream.getStr();
            this.dwIconBtn = inputStream.getInt();
            this.delay = inputStream.getByte();
            this.color = inputStream.getInt();
            this.szWeb = inputStream.getStr();
            this.dwAction = inputStream.getByte();
        }

		public function encode(outputStream: SrsStreamWriter, skip:Number=0): void {
        }
    	

	}
}
