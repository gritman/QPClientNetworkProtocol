package cmds {
	import com.gameabc.ipad.http.MessageVO;
	import com.gameabc.ipad.http.ParamVO;
	
	import org.puremvc.as3.patterns.command.SimpleCommand;
    
    public class ProtobuffCommand extends SimpleCommand {
                
		public var type:String;

		public var recvMessageVO:MessageVO;
		public var recvParamVO:ParamVO;
        
		public var sendMessageVO:MessageVO;
		public var sendParamVO:ParamVO;
        
        protected function sendHandler(data:*, action:String, paramVO:ParamVO): void {
            //抽象函数保持空，可减少子类忽略super引发的错误
        }
        
		protected function resultHandler(action:String, paramVO:ParamVO):void {
            //抽象函数保持空，可减少子类忽略super引发的错误
        }
	}
}
