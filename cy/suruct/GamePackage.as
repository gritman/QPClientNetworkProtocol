package cy.suruct {
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;
            
    /**
	 * @author huangkan
	 *  二级指令结构
	 */
    public class GamePackage implements IServerSuruct {
        
		public var xyId: uint;
        
		public var len: uint;
        
		public var data: ByteArray;
        
        public function GamePackage() {
            this.data = new ByteArray();
            this.data.endian = Endian.LITTLE_ENDIAN;
        }
		
        public function decode(inputStream: cy.SrsStreamReader, skip:Number=0): void {
            this.xyId = inputStream.getShort()
            this.len = inputStream.getShort();
            if (this.len > 0) {
                this.data = inputStream.getBytes(this.len);
            }
        }
        
		public function encode(outputStream: cy.SrsStreamWriter, skip:Number=0): void {
            outputStream.putShort(this.xyId);
            this.len = this.data.length;
            outputStream.putShort(this.len);
            if (this.len > 0) {
                outputStream.putBytes(this.data);
            }
        }
        
    }
    
}