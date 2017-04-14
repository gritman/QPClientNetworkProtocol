package cy.suruct {
	import cmds.SrsCommand;
	
	import cy.SrsLogger;
	import cy.SrsStreamWriter;
    
	/**
	 * @author huangkan
	 *  与SRS连接的进入房间环节命令集，进入房间过程在此完成
	 */
	public class JoinRoomCommand extends SrsCommand {
    	
        override protected function sendHandler(data: *, stream: SrsStreamWriter): void {
            
            this.sendPackage.sProcessID = 1;
            this.sendPackage.nAppID = userProxy.willJoinRoom.svrOfsId;
            
            // 传类型2时服务端不广播座位信息
            var clientType = userProxy.willJoinRoom.isVip ? 0 : 2;
            stream.putInt(userProxy.willJoinRoom.svrOfsId); //陈卫华SAY:此处传ofs appid
            stream.putInt(clientType); //客户端类型(手机) 
            stream.putInt(0); //硬件标识
            stream.putInt(0); //版本号
            var bytes = userProxy.reqPlayerPlusData.bytesCache;
            stream.putShort(bytes.length); //data size(限制1000长度)
            stream.putBytes(bytes);
            stream.putInt(parseInt(Platform.CHANNE_ID)); //渠道号
        
            SrsLogger.log("join" +
                   " numId:"+userProxy.svrNumId + 
                   " ofsId:"+userProxy.willJoinRoom.svrOfsId+
                   ""/*time:"+DateUtils.nowTime*/,SrsLogger.LOG_TYPE_ROOM);
        }
        
    }
    
    
}