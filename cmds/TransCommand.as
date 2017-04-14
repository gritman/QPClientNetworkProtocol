package cmds {
	
	import cy.SrsLogger;
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;
	import cy.cst.NetAction;
	import cy.suruct.GamePackage;
	
	public class TransCommand extends SrsCommand {
		
		override protected function sendHandler(data:*, stream: SrsStreamWriter): void {
			this.sendPackage.sProcessID = 1;
			this.sendPackage.nAppID = userProxy.currentRoom.svrOfsId;
			stream.putSuruct(data);
			SrsLogger.log("ct->gs:"+data.xyId,SrsLogger.LOG_TYPE_GS_SEND);
		}
		
		override protected function resultHandler(stream: SrsStreamReader): void {
			if(userProxy.currentRoom==null) return;
			if(userProxy.currentRoom.svrOfsId != this.recvPackage.nAppID) return;
			var gamePackage = stream.getSuruct(GamePackage);
			SrsLogger.log("gs->ct:"+gamePackage.xyId,SrsLogger.LOG_TYPE_GS_RECV);
			this.sendNotification(NetAction.RE_GS_PREFIX+gamePackage.xyId,gamePackage);
		}
		
	}
	
}