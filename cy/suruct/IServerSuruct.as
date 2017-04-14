package cy.suruct {
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;

	public interface IServerSuruct {
		
		function encode(outputStream: SrsStreamWriter, skip:Number=0): void;
		function decode(inputStream: SrsStreamReader, skip:Number=0): void;
	}
}