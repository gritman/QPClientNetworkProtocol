package cmds {
	import cy.SrsStreamReader;
	import cy.SrsStreamWriter;
	import cy.cst.LOGIN_TYPE;
	import cy.cst.NetAction;
	import cy.cst.SrsConst;
	import cy.suruct.ReqPlayerPlusData;

	public class LoginCommands extends SrsCommand {
		
		override protected function sendHandler(data: *, stream:SrsStreamWriter): void {
			switch(this.action) {
				//发送登录指令：data参数包含了账号与密码(其余状态固定)
				case NetAction.CMDT_PLAYERCONNECT:
					srsServer.niceSelect = null;                         //清空最佳负载缓存
					stream.putByte(2)                             //客户端类型
						.putByte(userProxy.loginUserType)   //玩家类型
						.putInt(SrsConst.AREA_ID)                 //区域ID
						.putStr(userProxy.loginName);       //用户账号
					if(userProxy.loginUserType==LOGIN_TYPE.SESSION){
						stream.putHex(userProxy.loginPass); //SESSION值
					} else {
						stream.putStr(userProxy.loginPass); //用户密码
					}
					var hdid = userProxy.hardwareId;
					stream.putStr(hdid==null ? "" :  hdid)        //硬件识别码
					.putInt(AppConst.VERSION_ID)              //游戏版本号
					.putInt(parseInt(Platform.CHANNE_ID))     //渠道号
					.putInt(0);                               //系统版本号
					return;
					
				case NetAction.GET_SRS_LOAD:
					stream.putShort(0);               //查询组内所有SRS服务器负载情况
					return;
					
				case NetAction.CMDT_REQPROCESSAPP:
					stream.putShort(data);
					return;
			}
		}
		
		override protected function resultHandler(stream:SrsStreamReader): void {
			
			switch(this.action) {
				case NetAction.RE_GET_SRS_LOAD:
					var len = stream.getUShort();
					var reFlag = false; //是否超过负载健康值
					for (var i=0; i<len; ++i) {
						var appId = stream.getUShort();
						var load = stream.getUShort();
						var srs = srsServer.search(appId);
						if (srs != null) {
							srs.load = load;
							//如果当前服务器负载已大于健康值(3000),则寻找最佳服务器
							if(srsServer.current==srs) {
								trace("load:curr="+srs.load);
								reFlag = load>3000;
							}
						}
					}
					
					//测试逻辑，有概率强制随机更换服务器
					// if (Math.random()<.5) {
					//     cy.niceSelect = cy.getSrsIp();
					//     console.log("test:best="+cy.niceSelect.load+",appid="+cy.niceSelect.appId);
					//     cy.closeConnection(cy.niceSelect);
					//     return;
					// }
					
					if (reFlag && srsServer.searchNice()!=srs) {
//						mc2sdk.event(mc2sdk.EVENT_TYPE.SRS_RECONNECT);
//						console.log("load:best="+cy.niceSelect.load+",appid="+cy.niceSelect.appId);
						srsServer.reConnect = srsServer.niceSelect;
						srsServer.close();
					} else {
						srsServer.exCommand(NetAction.CMDT_PLAYERCONNECT);
					}
					return;
					
					
					//服务端需要令牌
				case NetAction.CMDT_REQEAUTH:
					var nOfsAppId = stream.getInt();
					var nSAskId = stream.getInt();
					var cbEType = stream.getByte();
					var cbSubEType = stream.getByte();
					var szNum = stream.getStr();
					
					return;
					
					
					// 服务端推送一键登录的相关信息过来
				case NetAction.CMDT_PTPUSHMSG:
					var nAskId = stream.getInt();
					var szMsg = stream.getStr();
					
					return;
					
					
					//服务端响应登录
				case NetAction.CMDT_PLAYERDATA:
					var cbFlag = stream.getByte();                       //错误号
					var nAreaID = stream.getInt();                    //区号(即brandId)
					var nNumId = stream.getInt();                     //数字账号
					var roleId = nAreaID * 4294967296.0 + nNumId;     //合并数字ID
					var szNickName = stream.getStr();                    //玩家昵称
//					userProxy.propertURL = stream.getStr();        //实名认证登记地址
					
					trace('areaId='+nAreaID);
					trace('numId='+nNumId);
					
//					if (cbFlag != 0) mc2sdk.event(mc2sdk.EVENT_TYPE.LOGIN_FAIELD,cbFlag);
					
					if (cbFlag == 1) {
						var szMsg = "";
						//    var szMsg = stream.getStr();                      //错误信息
//						tip.popSysCenterTip("登录失败 " + szMsg + " [ID:" + cbFlag + "]",AppConst.TIPS_TYPE.TIPS_WARNING);
						srsServer.close();
//						this.sendNotification(constant.AppMediatorConst.LOGIN_FAILED);
						return;
					}
						
						//边锋平台账号绑定注册茶苑账号
					else if(cbFlag == 2) {
//						var sdoid:String = userProxy.loginName;
//						var AD:String = "0";
//						var registerURL:string = AppConst.BFPT_TO_GAMET_REG_URL;
//						sdoid = "sdoid="+sdoid;
//						AD = "AD=" + AD;
//						registerURL += sdoid + "&" + AD;                       
//						utils.NativeUtils.openurl(registerURL);
						
						srsServer.close();
//						this.sendNotification(constant.AppMediatorConst.LOGIN_FAILED);
						return;
					}
						
					else if (cbFlag != 0) {
//						this.tipError(cbFlag,"登录失败");
						srsServer.close();
//						this.sendNotification(constant.AppMediatorConst.LOGIN_FAILED);
						return;
					}
					
					if (stream.getAvailable() >= 16) {
						var sessionID = stream.getHex(16);
					}
					
					userProxy.svrRoleId = roleId;
					userProxy.svrNumId = nNumId;
					userProxy.svrAreaId = nAreaID;
					userProxy.svrName = szNickName;
					if(userProxy.svrSession == null) {
						userProxy.svrSession = sessionID;
					}
					// console.log("svrSession: " + userProxy.svrSession);
					
//					this.sendNotification(NetAction.CMDT_REQPROCESSAPP,11);//更新比赛列表服的appid
					//发送23号指令，获取玩家数据
					srsServer.exCommand(NetAction.CMDT_REQPLAYERPLUSDATA);
					
					return;
					
					//接受24号指令(23号回复)，保存玩家数据
				case NetAction.CMDT_RESPPLAYERPLUSDATA:
					userProxy.reqPlayerPlusData = stream.getSuruct(ReqPlayerPlusData) as ReqPlayerPlusData;
					userProxy.joinRoom(AppConst.TEST_ROOM);
					return;
					
			}
		}
		
		
	}
}