package cy {
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import cy.suruct.IServerSuruct;

	public class SrsStreamWriter {
		protected var stream: ByteArray;
		
		public function SrsStreamWriter(stream: ByteArray) {
			this.stream = stream;
			stream.endian = Endian.LITTLE_ENDIAN;
		}
		
		public function putLong(value: Number, skip: Number=0, bigEndian:Boolean=false): SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			if (bigEndian) {
				this.stream.writeUnsignedInt(Math.floor(value / 4294967296.0));
				this.stream.writeUnsignedInt(value);
			} else {
				this.stream.writeUnsignedInt(value);
				this.stream.writeUnsignedInt(Math.floor(value / 4294967296.0));
			}
			return this;
		}
		
		public function putUInt(value: Number,skip: int=0): SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			this.stream.writeUnsignedInt(value);
			return this;
		}
		
		public function putInt(value: Number,skip: int=0): SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			this.stream.writeInt(value);
			return this;
		}
		
		public function putShort(value: Number,skip: int=0): SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			this.stream.writeShort(value);
			return this;
		}
		
		public function putUShort(value: Number,skip: int=0): SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			this.stream.writeShort(value);
			return this;
		}
		
		/** 写入字符串类型(服务端使用GBK编码表示中文，默认BYTE表示长度) */
		public function putStr(value: String,skip: int=0): SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			this.putStrLength(value);
			this.stream.writeMultiByte(value, 'gb2312');
			return this;
		}
		
		public function putStrLength(value:String, skip:int=0):SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			var len = value.length;
			var pLen = 0;
			for(var i=0; i<len; ++i) {
				if(value.charAt(i)=="%"){
					++pLen;
					i+=2;
				}
			}
			var sLen = len - (pLen*2);
			if(sLen < 255) {
				this.stream.writeByte(sLen);
			} else if (sLen < 0xFFFE) {
				this.stream.writeByte(0xFF);
				this.stream.writeShort(sLen);
			} else {
				this.stream.writeByte(0xFF)
				this.stream.writeShort(0xFFFF);
				this.stream.writeInt(sLen);
			}
			return this;
		}
//		
//		
//		
//		public function putBool(value: Boolean,skip: int=0): SrsStreamWriter {
//			if(skip != 0) this.stream.position += skip;
//			this.stream.writeBoolean(value);
//			return this;
//		}
//		
		public function putByte(value: int,skip: int=0): SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			this.stream.writeByte(value);
			return this;
		}
		
		
		public function putBytes(value: ByteArray, offset:int=0, len:int=0, skip:int=0): SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			if(len==0) len = value.length;
			this.stream.writeBytes(value,offset,len);
			return this;
		}

		/** 写入约定的子结构体 */
		public function putSuruct(value:IServerSuruct, skip:int=0) : SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			value.encode(this);
			return this;
		}

		/** 按字节长度写入16进制原始编码，若第一位为%,将以uri形式写入 */
		public function putHex(value:String, skip:int=0):SrsStreamWriter {
			if(skip != 0) this.stream.position += skip;
			var uri = value.charAt(0)=="%" ? 1 : 0;
			var len = value.length / (2+uri);
			for (var i:Number=0; i<len; ++i) {
				var hexStr = value.charAt(i*(2+uri)+uri)+value.charAt(i*(2+uri)+1+uri);
				this.stream.writeByte(parseInt(hexStr,16));
			}
			return this;
		}
	}
}