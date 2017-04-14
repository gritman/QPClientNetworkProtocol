package cy.suruct {
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import cy.EncryptHelper;
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;
	
	/**
	 * @author huangkan
	 *  SRS基础详细结构
	 *  
	 *  细节且听张力SAY: 简单来说SRSXY.h里的协议发送时APPID和PROCESSID都是0
	 *  其他功能模块的协议PROCESSID必须填，
	 *  APPID看情况，有状态的必须填入发到游戏模块，无状态的可以不填，如发到工具模块的
	 */
	public class SrsPackage
	{
		/** 标志位 */
		protected var sFlag: int = 16385;   // 2 << 13 | 1
		
		/** 包体大小,不包含包头的大小 */
		protected var sLen: int = 0; 
		
		/** 协议id */
		public var sXYID: int = 0;
		
		/** 服务器模块id */
		public var sProcessID: int = 0;
		
		/** 服务器服务id */
		public var nAppID: int = 0;
		
		/** 包体 */
		public var data: ByteArray;
		
		
		public function SrsPackage() {
			this.data = new ByteArray();
			this.data.endian = Endian.LITTLE_ENDIAN;
		}
		
		
		public function decode(inputStream: SrsStreamReader): void {
			this.sFlag = inputStream.getUShort()
			this.sLen = inputStream.getUShort();
			this.sXYID = inputStream.getUShort();
			this.sProcessID = inputStream.getUShort();
			this.nAppID = inputStream.getInt();
			
			if(this.sLen > 0) {
				this.data = inputStream.getBytes(this.sLen);
			}
			
			if(this.sFlag & 1) {
				this.data = EncryptHelper.decode(this.data);
				this.data.endian = Endian.LITTLE_ENDIAN;
			}
			
		}
		
		
		public function encode(outputStream: SrsStreamWriter): void {
			this.sLen = this.data.length;
			outputStream.putUShort(this.sFlag);
			outputStream.putUShort(this.sLen);
			outputStream.putUShort(this.sXYID);
			outputStream.putUShort(this.sProcessID);
			outputStream.putInt(this.nAppID);

			if(this.sFlag & 1) {
				this.data = EncryptHelper.encode(this.data);
			}
			outputStream.putBytes(this.data);
		}
	}
}

