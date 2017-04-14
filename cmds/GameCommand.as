package cmds {
	import com.gameabc.ipad.http.MessageVO;
	import com.gameabc.ipad.http.ParamVO;
	
	import flash.utils.ByteArray;
	
	import cy.suruct.GamePackage;
	
	import org.puremvc.as3.interfaces.INotification;
    
	/**
	 * @author huangkan 
	 *  游戏内二级消息命令集
	 */
    public class GameCommand extends ProtobuffCommand {
                
        protected var recvGamePackage:GamePackage;
        
		protected var sendGamePackage:GamePackage;
        
        override public function execute(notification: INotification): void {
            var commandId = notification.getName();
            var cmds = commandId.split(".");
            var body = notification.getBody();
            if (body instanceof GamePackage) {
                this.recvGamePackage = body;
                this.recvMessageVO = new MessageVO();
				this.recvMessageVO.mergeFrom(this.recvGamePackage.data);
                this.resultHandler(commandId, this.recvMessageVO.data);
            } else {
                
                if(userProxy.currentRoom==null) {
                    trace("已离开房间，无法操作房间内行为");
                    return;
                }
                
	            this.sendParamVO = body instanceof ParamVO ? body : new ParamVO();
	            this.sendHandler(body, commandId, this.sendParamVO);
	            this.sendMessageVO = new MessageVO(); 
	            this.sendMessageVO.data = this.sendParamVO;
	            this.sendGamePackage = new GamePackage();
	            this.sendGamePackage.data = new ByteArray();
				this.sendMessageVO.writeTo(this.sendGamePackage.data);
	            this.sendGamePackage.xyId = parseInt(cmds[1]);
	            this.sendNotification(cmds[0], this.sendGamePackage);
     	    }
   		}
	}
}
