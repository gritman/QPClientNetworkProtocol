package cmds {
	import cy.SrsServer;
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;
	import cy.cst.NetAction;
	import cy.suruct.SrsPackage;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class SrsCommand extends SimpleCommand {
		
		protected var pocsact:String;
		protected var process:String;
		protected var action:String;
		protected var sendPackage: SrsPackage;
		protected var recvPackage: SrsPackage;
		
		protected function get srsServer():SrsServer {
			return SrsServer.instance;
		}

		
		override public function execute(notification:INotification):void {
			this.parse(notification.getName(),notification.getBody());
		}
		
		public function parse(id:String, data:*): void {
			var process_action = id.split(NetAction.PROCESS_CUT);
			if (process_action.length == 1) {
				this.action = process_action[0];
			} else if (process_action.length == 2) {
				this.process = process_action[0];
				this.action = process_action[1];
				this.pocsact = this.process + NetAction.PROCESS_CUT + this.action;
			}
			if(data instanceof SrsPackage) {
				this.recvPackage = data;
				this.resultHandler(new SrsStreamReader(this.recvPackage.data));
			} else {
				this.sendPackage = new SrsPackage();
				this.sendPackage.sProcessID = parseInt(this.process);
				this.sendPackage.sXYID = parseInt(this.action);
				this.sendHandler(data,new SrsStreamWriter(this.sendPackage.data));
				srsServer.send(this.sendPackage);
			}
		}
		
		protected function sendHandler(data: *, stream:SrsStreamWriter): void {
			//抽象函数保持空，可减少子类忽略super引发的错误
		}
		
		protected function resultHandler(stream:SrsStreamReader): void {
			//抽象函数保持空，可减少子类忽略super引发的错误
		}
	}
}