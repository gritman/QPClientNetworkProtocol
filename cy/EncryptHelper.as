package cy {
	import com.hurlant.crypto.symmetric.AESKey;
	import com.hurlant.crypto.symmetric.CFBMode;
	import com.hurlant.crypto.symmetric.NullPad;
	import com.hurlant.util.Hex;
	
	import flash.utils.ByteArray;
	

	public class EncryptHelper {
		
		
//		private static var key:String = "AFE21A0C16735413FD68DD8FA0B7C15726A690FFCDB354611007D57EDB1E4CE9";
		private static var key:String = "F362120513E389FF2311D7360123100705A210007ACC023C3901DA2ECB12448B"
		private static var iv:String = "15FF010034AB4CD355FEA122084F1307";
		
		
		public static var akey:ByteArray;
		public static var aiv:ByteArray;
		
		public static function init():void {
			akey = Hex.toArray(key);
			aiv = Hex.toArray(iv);
		}
		
		public static function parse(u8arr:Array): ByteArray{
			// Shortcut
			var len:Number = u8arr.length;
			// Convert
			var words:Array = [];
			for (var i:int = 0; i < len; i++) {
				var index:int = i >>> 2;
				words[index] |= (u8arr[i] & 0xff) << (24 - (i % 4) * 8);
				var ub:uint = words[index];
				words[index] = ub
//				words[i] = u8arr[i];
			}
			var bytes:ByteArray = new ByteArray();
			for (var i:int=0; i<len; ++i) {
				bytes.writeByte(words[i]);
			}
			return bytes;
		}
//		
//		public static function stringify(wordArray:Array):ByteArray {
//			var words:Array = wordArray;
//			var sigBytes:int = wordArray.length;
//			// Convert
//			var bytes:ByteArray = new ByteArray();
//			for (var i:int = 0; i < sigBytes; i++) {
//				var byte = (words[i >>> 2] >>> (24 - (i % 4) * 8)) & 0xff;
//				bytes.writeByte(byte);
//			}
//			
//			return bytes;
//		}
		
//		public static function convertU8Array(bytes:ByteArray):Array {
//			bytes.position = 0;
//			var u8Array:Array = [];
//			var len:int = bytes.length;
//			for(var i:int = 0; i != len; i++) {
//				u8Array.push(bytes.readByte());
//			}
//			return u8Array;
//		}
		
		public static function encode(bytes:ByteArray):ByteArray {
			
			bytes.position = 0;
			
			//var aes:AESKey = new AESKey(akey);
			var cfb:CFBMode = new CFBMode(new AESKey(akey),new NullPad());
			
			var encodeBytes:ByteArray =  new ByteArray();
			bytes.readBytes(encodeBytes);
			
			cfb.IV = aiv;
			cfb.encrypt(encodeBytes);
//			return stringify(convertU8Array(encodeBytes));
				
			return encodeBytes;
		}
		
		public static function decode(bytes:ByteArray):ByteArray {
			
			bytes.position = 0;
			
//			var aes:AESKey = new AESKey(akey);
			var cfb:CFBMode = new CFBMode(new AESKey(akey),new NullPad());
			
			var decodeBytes:ByteArray = new ByteArray();
			bytes.readBytes(decodeBytes);
			
			//var bs64_str:String = decodeBytes.readUTFBytes(decodeBytes.length);
//			var bs:Base64 = new Base64Encoder();
//			bs.insertNewLines = true;
//			bs.(encodeBytes);
			//var bs64code:ByteArray = Base64.decodeToByteArray(bs64_str);
						
			cfb.IV = aiv;
			cfb.decrypt(decodeBytes);
				
//			return stringify(convertU8Array(decodeBytes));
			return decodeBytes;
		}
	}
}


	
