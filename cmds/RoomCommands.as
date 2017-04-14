package cmds {
	import cy.SrsLogger;
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;
	import cy.cst.NetAction;
	import cy.cst.ROOM_STATE;
	import cy.suruct.MsgBox;
	import cy.suruct.PlayerSet;

	public class RoomCommands extends SrsCommand {
		
		override protected function sendHandler(data: *, stream:SrsStreamWriter): void {
			
			if (userProxy.currentRoom == null) {
				trace("当前不在房间内，不能操作房间内行为");
				return;
			}
			
			this.sendPackage.sProcessID = 1;
			this.sendPackage.nAppID = userProxy.currentRoom.svrOfsId;
			
			switch (this.action) {
				
				//设置坐下的密码
				case NetAction.PLAYER_SET_LIMIT:
					var playerSet = new PlayerSet();
					playerSet.password = data;
					stream.putSuruct(playerSet);
					stream.putStr("");
					stream.putStr("");
					return;
					
					
					//房间动作(坐下，站起等)
				case NetAction.ROOM_ACTION:
					stream.putByte(  data[0]);                      //动作
					stream.putShort( data[1]==null ?  0 : data[1]); //桌子ID
					stream.putByte(  data[2]==null ?  0 : data[2]); //座位ID
					stream.putStr(   data[3]==null ? "" : data[3]); //密码内容
					stream.putInt(srsServer.addAskCmd(    data[0]));//创建指令缓存
					return;
					
					//进入游戏前，检查游戏版本号
				case NetAction.CHECK_VER:
					//1.2011.07.18
					// stream.putLong((1<<22)|(2011<<9)|(7<<5)|18); //版本号
					stream.putInt(120110718);
					return;
					
					
					//成功进入游戏，连接游戏服务器
				case NetAction.CONNECT_GS:
					stream.putInt(userProxy.currentRoom.svrOfsId); //房间编号
					// stream.putInt(userProxy.svrAreaId); //玩家区号
					// stream.putInt(userProxy.svrUserId); //玩家数字账号
					stream.putLong(userProxy.svrRoleId);
					stream.putStr("");//sessionId(已停用)
					return;
					
			}
		}
		
		override protected function resultHandler(stream:SrsStreamReader): void {
			switch(this.action) {
				
				//响应玩家进入房间
				case NetAction.RE_JOIN_ROOM:
					var flag = stream.getByte();
					var type = stream.getByte();
					var roomId = stream.getInt();
					
					
					if(flag == 0) {
						if (userProxy.roomState == ROOM_STATE.IN) return;
						userProxy.joinRoomSuccess();
//						room.getProxy().resetRoom();
						SrsLogger.log("join success ofsid:"+userProxy.currentRoom.svrOfsId,SrsLogger.LOG_TYPE_ROOM);
					} else {
						userProxy.joinRoomFailed();
					}
					return;
								
								
				//进入房间时的所有推送完成，可执行下一步操作    
				case NetAction.RE_JOIN_ROOM_COMPLETE:
					SrsLogger.log("join complete ofsid:"+userProxy.currentRoom.svrOfsId,SrsLogger.LOG_TYPE_ROOM);
//					srsServer.addConnectHeart(NetAction.ROOM_CHECKACT);
//					srsServer.exCommand(NetAction.JOIN_MATCH_GAME);
					return;
								
								
				//响应玩家动作
				case NetAction.RE_ROOM_ACTION:
					var flag = stream.getByte();
					if(flag == 1) {
						var msgBox = stream.getSuruct(MsgBox);
//						mc2sdk.event(mc2sdk.EVENT_TYPE.ROOM_ACT_FAILED, msgBox.szText);
//						tip.popSysCenterTip(msgBox.szText,AppConst.TIPS_TYPE.TIPS_WARNING);
						SrsLogger.log(msgBox.szText,SrsLogger.LOG_TYPE_UNDEFINE);
					} else if (flag != 0) {
//						mc2sdk.event(mc2sdk.EVENT_TYPE.ROOM_ACT_FAILED, flag);
					}
					if(stream.getAvailable()>0) {
						var action = srsServer.getAskCmd(stream.getInt());
						// if(action==5)tip.popSysTopTip(gameabc.ResourceBundleUtil.getMessage("CHANGE_TABLE_SUCCESS"));
					}
					return;
								
								
				//推送游戏可以开始的消息    
				case NetAction.RE_SERVER_READY:
					var canStart = stream.getBool();
					if (canStart) {
						//游戏开始前，检查版本号
						srsServer.exCommand(NetAction.CHECK_VER);
					}
					return;
								
								
				//响应版本号检查
				case NetAction.RE_CHECK_VER:
					var flag = stream.getByte();
					var ver = stream.getInt();
					if (flag == 0) {
						srsServer.exCommand(NetAction.CONNECT_GS);
					} else if(flag == 1) {
						var msgBox = stream.getSuruct(MsgBox);
						SrsLogger.log(msgBox.szText,SrsLogger.LOG_TYPE_UNDEFINE);
					}
					return;
						
						
							
				//连接游戏服务器结果回复              
				case NetAction.RE_CONNECT_GS:
					var flag = stream.getByte();
					if (flag == 0) {
						srsServer.exCommand(NetAction.SET_PLAY_INFO,[userProxy.svrRoleId]);
						this.sendNotification(NetAction.GAME_READY);
					}
					return;
							
							
				//离开房间成功
				case NetAction.RE_LEAVE_ROOM:
					if(userProxy.currentRoom==null) {
						SrsLogger.log("leave success ofsid:unknown.",SrsLogger.LOG_TYPE_ROOM);
					} else {
						SrsLogger.log("leave success ofsid:"+userProxy.currentRoom.svrOfsId,SrsLogger.LOG_TYPE_ROOM);
					}
					userProxy.leaveRoomSuccess();
//					srsServer.removeConnectHeart(NetAction.ROOM_CHECKACT);
					var flag = stream.getByte();
					if (flag == 0) { //普通退出
						if(userProxy.willJoinRoom == null) {
						
						} else {
							userProxy.joinRoom(userProxy.willJoinRoom);
						}
					} else if (flag == 1) { //被T了
						
					}
					return;
								
			}
		}
	}
}