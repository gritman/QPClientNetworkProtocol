package cy {
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import cy.suruct.IServerSuruct;

	public class SrsStreamReader {
		public function SrsStreamReader(stream:ByteArray) {
			this.stream = stream;
			this.stream.endian = Endian.LITTLE_ENDIAN;
		}
		
		public var stream:ByteArray;
		
		public function getAvailable():int {
			return this.stream.bytesAvailable;
		}
		
		public function getInt(skip:int=0):int {
			if(skip != 0) this.stream.position += skip;
			return this.stream.readInt();
		}
		
		public function getUInt(skip:int=0):uint {
			if(skip != 0) this.stream.position += skip;
			return this.stream.readUnsignedInt();
		}
		
		public function getShort(skip: int=0): int {
			if(skip!= 0) this.stream.position += skip;
			return this.stream.readShort();
		}
		
		public function getUShort(skip: int=0): uint {
			if(skip != 0) this.stream.position += skip;
			return this.stream.readUnsignedShort();
		}
//		
//		public function getLong(skip: int=0, bigEndian:Boolean=false): Number {
//			if(skip != 0) this.stream.position += skip;
//			var high:uint = this.stream.readUnsignedInt();
//			var low:uint = this.stream.readUnsignedInt();
//			return bigEndian ? high * 4294967296.0 + low : low * 4294967296.0 + high;
//		}
//		
		/** 读取字符串类型(服务端使用GBK编码表示中文，默认BYTE表示长度) */
		public function getStr(skip: int=0): String {
			var len:int = this.getStrLength(skip);
			return this.stream.readMultiByte(len,"bg2312");
		}
		public function getStrLength(skip: int=0):int {
			if(skip != 0) this.stream.position += skip;
			var len: int = this.stream.readUnsignedByte();
			if (len == 0xFF) {
				len = this.stream.readUnsignedShort();
				if (len == 0xFFFF) {
					len = this.stream.readUnsignedInt();
				}
			}
			return len;
		}
//		
//		public function getUTFStr(skip: int=0): String {
//			if(skip != 0) this.stream.position += skip;
//			var len: int = this.stream.readUnsignedByte();
//			return len > 0 ? this.stream.readUTFBytes(len) : "";   
//		}
		public function getBool(skip: int=0):Boolean {
			if(skip != 0) this.stream.position += skip;
			return this.stream.readBoolean();
		}
		
		public function getByte(skip: int=0): int {
			if(skip != 0) this.stream.position += skip;
			return this.stream.readByte();
		}
//		public function getUByte(skip: int=0): int {
//			if(skip != 0) this.stream.position += skip;
//			return this.stream.readUnsignedByte();
//		}
//		
		/** 按长度读取字节流(若指定cache，讲在cache中写入，并返回。
		 * 注意：将从cache的position处开始写入，但不会改变cache的position值) */
		public function getBytes(len: int,cache: ByteArray=null, skip:int=0):ByteArray {
			if(cache == null) {
				cache = new ByteArray();
				cache.endian = Endian.LITTLE_ENDIAN;
			}
			if(skip != 0) this.stream.position += skip;
			this.stream.readBytes(cache,cache.position,len);
			return cache;
		}
		
		/** 指定结构体类型（实现IServerSuruct的类），返回具体的结构体。 */
		public function getSuruct(suruct:*, skip: int=0):IServerSuruct {
			if(skip != 0) this.stream.position += skip;
			var suructInstence:IServerSuruct = new suruct();
			suructInstence.decode(this);
			return suructInstence;
		}
		
		/** 按字节长度返回16进制原始编码，uri指定是否以uri形式显示 */
		public function getHex(len:int, uri:Boolean=false, skip:int=0):String {
			if(skip != 0) this.stream.position += skip;
			var hexStr = "";
			for (var i:int=0; i<len; ++i) {
				var byte = this.stream.readUnsignedByte();
				var bytesStr = (byte<0x10?"0":"") + byte.toString(16);
				if (uri) {
					if (byte<0x7e&&byte>0x20) {
						hexStr += String.fromCharCode(byte);
					} else {
						hexStr += "%" + bytesStr.toLocaleUpperCase();
					}
				} else {
					hexStr += bytesStr;
				}
			}
			return hexStr;
		}
	}
}
