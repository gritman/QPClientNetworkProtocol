package cy.cst {
	
	public class NetAction {
		
		
		public static const VIRTUAL_SERVER :String = "VIRTUAL_SERVER";
		public static const SRS_CONNECT    :String = "SRS_CONNECT";
		public static const SRS_ERROR      :String = "SRS_ERROR";
		public static const SRS_CLOSE      :String = "SRS_CLOSE";
		
		public static const CMDT_ENCRYPTVER         :String = "1";
		public static const CMDT_CHECKACT           :String = "2";
		public static const CMDT_REQKEY             :String = "3";
		public static const CMDT_RESPKEY            :String = "4";
		public static const CMDT_PLAYERCONNECT      :String = "5";  //SRS协议，请求登录
		public static const CMDT_PLAYERDATA         :String = "6";  //SRS协议，登录返回
		public static const CMDT_REQEAUTH           :String = "7";  //服务端通知需要验证令牌
		public static const CMDT_RESPEAUTH          :String = "8";  //客户端输入验证令牌
		public static const CMDT_REPORTSRSERR       :String = "9";  //SRS协议，通知其他服务错误
		public static const GET_SRS_LOAD            :String = "10"; //查询SRS负载
		public static const RE_GET_SRS_LOAD         :String = "11"; //服务返回SRS负载
		public static const CMDT_REQPROCESSAPP      :String = "12"; //查询Process的AppId
		public static const CMDT_RESPPROCESSAPP     :String = "13"; //返回Process的AppId
		public static const CMDT_REQPLAYERPLUSDATA  :String = "23"; //SRS协议，获取用户数据
		public static const CMDT_RESPPLAYERPLUSDATA :String = "24"; //SRS协议，返回用户数据
		public static const CMDT_REQSYNCDATA        :String = "25"; //SRS协议，主动通知数据变更
		public static const CMDT_PTPUSHMSG          :String = "26"; //服务端推送玩家的令牌信息
		
		
		public static const DEBUG_CMDT_CONNECT            :String = "DEBUG_CMDT_CONNECT";
		public static const DEBUG_CMDT_ENCRYPTVER         :String = "501";
		public static const DEBUG_CMDT_REQKEY             :String = "401";
		public static const DEBUG_CMDT__RESPKEY           :String = "402";
		public static const DEBUG_CMDT_PLAYERCONNECT      :String = "11001";    //进入游戏打牌
		public static const DEBUG_CMDT_RESP_PLAYERCONNECT :String = "11103";    //进入打牌的状态结果返回
		
		
		
		
		/** 请求查询玩家游戏数据 */
		public static const TOOL_RILVER          :String = "12005";
		/** 返回查询玩家游戏数据 */
		public static const RE_TOOL_RILVER       :String = "12006"
		/** 请求房间人数 */
		public static const TOOL_NUMPLAYERS      :String = "12044";
		/** 返回房间人数 */
		public static const RE_TOOL_NUMPLAYERS   :String = "12045";
		
		public static const TOOL_TEMP_SESSION    :String = "12007";
		
		public static const RE_TOOL_TEMP_SESSION :String = "12008";
		
		public static const GET_PROP_ATTRS       :String = "12009";
		
		public static const RE_GET_PROP_ATTRS    :String = "12010";
		
		public static const USE_EPROPS           :String = "12050";
		
		public static const RE_USE_EPROPS        :String = "12051";
		
		
		
		
		/** 请求存取款 */
		public static const TRANSFER_SILVER            :String = "11060";
		public static const RE_TRANSFER_SILVER         :String = "11061";
		/** 离开房间 */
		public static const LEAVE_ROOM                 :String = "11073";
		/** 服务器响应离开房间 */
		public static const RE_LEAVE_ROOM              :String = "11074";
		/** 请求进入房间 */
		public static const JOIN_ROOM                  :String = "11007";
		/** SRS协议，响应请求进入房间 */
		public static const RE_JOIN_ROOM               :String = "11008";
		/** 请求房间内操作 */
		public static const ROOM_ACTION                :String = "11016";
		/** 响应房间内操作 */
		public static const RE_ROOM_ACTION             :String = "11017";
		/** 服务端推送桌子信息 */
		public static const RE_TABLE_INFO              :String = "11014";
		/** 服务端推送玩家信息 */
		public static const RE_USER_INFO               :String = "11009";
		/** 服务端通知进入房间成功 */
		public static const RE_JOIN_ROOM_COMPLETE      :String = "11041";
		/** 设置玩家限制(限制同桌密码IP等) */
		public static const PLAYER_SET_LIMIT           :String = "11022";
		/** 服务端更新房间状态 */
		public static const RE_ROOM_STATE              :String = "11027";
		/** 服务端更新玩家数据 */
		public static const RE_PLAYER_NUM_INFO         :String = "11028";
		/** 服务端通知客户端是否可以开始游戏 */
		public static const RE_SERVER_READY            :String = "11013";
		/** 检测游戏客户端版本号 */
		public static const CHECK_VER                  :String = "113";
		/** 响应检测游戏客户端版本号 */
		public static const RE_CHECK_VER               :String = "114";        
		/** 连接游戏服务器 */
		public static const CONNECT_GS                 :String = "11100";
		/** 响应连接游戏服务器 */
		public static const RE_CONNECT_GS              :String = "11103";
		/** 通知客户端操作 */
		public static const NOTICE_CLIENT_ACTION       :String = "11049";
		/** 通知客户端玩家进入排队状态 */
		public static const NOTICE_CLIENT_WAITING_LIST :String = "11104";
		
		/** 加入比赛模式 */
		public static const JOIN_MATCH_GAME            :String = "11601";
		/** 返回加入比赛模式 */
		public static const RE_JOIN_MATCH_GAME         :String = "11602";
		/** 当前比赛连接数 */
		public static const MATCH_PLAYER_COUNT         :String = "11603";
		/** 当前比赛玩家信息 */
		public static const MATCH_PLAYER_INFO          :String = "11604";
		/** 比赛提示信息 */
		public static const MATCH_HINT                 :String = "11605";
		/** 请求更新玩家积分(暂时当做READY在用，不支持单独发送) */
		public static const REQ_COIN                   :String = "11062";
		public static const RESP_COIN                  :String = "11063";
		/** 房间心跳 */
		public static const ROOM_CHECKACT              :String = "11079";
		
		public static const PROCESS_CUT         :String = "-"
		public static const MATCH_CFG_PROCESS   :String = "11" + NetAction.PROCESS_CUT;
		public static const MATCH_PROCESS       :String = "12" + NetAction.PROCESS_CUT;
		
		
		/** 加入前缀的process，将强制使用符合式的Action指令接收服务端消息 */
		public static const PROCESS_PREFIX:Array      = [11,12];
		
		/** 模块服务端的PROCESSID */
		public static const MS_PROCESSID:int = 1006;
		/** 模块服务端的APPID */
		public static const MS_APPID:int     = 0;
		/** 发送到模块服务端的指令，5位数字，21开头 */
		public static const TO_MS_PREFIX        :String = "21";
		/** 从模块服务端接收的指令，5位数字，22开头 */
		public static const RE_MS_PREFIX        :String = "22";
		/** 发送到公告服务器的指令，HTTP短连接，5位数字，3开头 */
		public static const NS_PREFIX           :String = "3";
		
		public static const TEST:String = NetAction.TO_MS_PREFIX + "999";
		
		/** 连接比赛配置服 */
		public static const JOIN_MATCH_CFG         :String = NetAction.MATCH_CFG_PROCESS + "1";
		
		public static const RE_JOIN_MATCH_CFG      :String = NetAction.MATCH_CFG_PROCESS + "2";
		/** 推送比赛配置列表 */
		public static const MATCH_CONFIG_LIST      :String = NetAction.MATCH_CFG_PROCESS + "3";
		/** 客户端获取当前比赛的SUBID */
		public static const GET_MATCH_LIST         :String = NetAction.MATCH_CFG_PROCESS + "4";
		
		public static const RE_GET_MATCH_LIST      :String = NetAction.MATCH_CFG_PROCESS + "5";
		/** 更新比赛人数 */
		public static const UPDATE_MATCH_SINGUPS   :String = NetAction.MATCH_CFG_PROCESS + "7";
		
		public static const MATCH_CFG_CHECKACT     :String = NetAction.MATCH_CFG_PROCESS + "9";
		
		public static const JOIN_MATCH             :String = NetAction.MATCH_PROCESS + "1";
		
		public static const RE_JOIN_MATCH          :String = NetAction.MATCH_PROCESS + "2";
		
		public static const SIGN_UP_MATCH          :String = NetAction.MATCH_PROCESS + "3";
		
		public static const RE_SIGN_UP_MATCH       :String = NetAction.MATCH_PROCESS + "4";
		/** 客户端发送取消报名 */
		public static const CANCEL_SIGNUP          :String = NetAction.MATCH_PROCESS + "5";
		/** 服务端返回发送取消报名 */
		public static const RE_CANCEL_SIGNUP       :String = NetAction.MATCH_PROCESS + "6";
		
		public static const MATCH_REWARD           :String = NetAction.MATCH_PROCESS + "11";
		
		public static const MATCH_CHECKACT         :String = NetAction.MATCH_PROCESS + "12";
		/** 在比赛开始的时候发送给客户端（广播给报名过的玩家） */
		public static const MATCH_WHEEL_INFO       :String = NetAction.MATCH_PROCESS + "15";
		/** 在比赛完成结算的时候发送给客户端 */
		public static const MATCH_WHEEL_REWARD     :String = NetAction.MATCH_PROCESS + "16";
		
		public static const CHAT_MSG               :String = "107"; //房间聊天
		
		/** 游戏服务器通信协议发送 */
		public static const TO_GS :String = "11201"; 
		/** 游戏服务器通信协议返回 */
		public static const RE_GS :String = "11200";
		/** 发送 游戏服务器二级通信协议 前缀 */
		public static const TO_GS_PREFIX :String = NetAction.TO_GS + ".";
		/** 接收 游戏服务器二级通信协议 前缀 */
		public static const RE_GS_PREFIX :String = NetAction.RE_GS + ".";
		/*服务器推送错误代*/
		public static const ERROR_CODE         :String = NetAction.RE_GS_PREFIX + "2000";
		/** 准备开始 */
		public static const GAME_READY         :String = NetAction.TO_GS_PREFIX + "9";
		/** 获取牌桌具体信息 - 玩家、座位信息 */
		public static const MATCH_ADD          :String = NetAction.RE_GS_PREFIX + "1100"; // 进入桌子
		/** 玩家操作 */
		public static const MATCH_ACTION       :String = NetAction.TO_GS_PREFIX + "1101";
		/** 推送牌局开始 */
		public static const MATCH_S_START      :String = NetAction.RE_GS_PREFIX + '1102';
		/** 推送新一圈开始 */
		public static const MATCH_S_NEWSTART   :String = NetAction.RE_GS_PREFIX + '1103';
		/** 推送收到底牌 */
		public static const MATCH_S_GETCARD    :String = NetAction.RE_GS_PREFIX + '1104';
		/** 收到玩家动作 */
		public static const MATCH_S_PLAYACT    :String = NetAction.RE_GS_PREFIX + '1105';
		/** 牌局结束 */
		public static const MATCH_S_OVER       :String = NetAction.RE_GS_PREFIX + '1106';
		/** 进入桌子 */
		//       public public static const MATCH_ENTER_TABLE :String = NetAction.RE_GS_PREFIX + '1123';
		/** 系统发牌 */
		public static const TEXAS_SHOW_CARD    :String = NetAction.RE_GS_PREFIX + '1107';
		/**推送桌子坐下*/
		public static const MATCH_S_SIT        :String = NetAction.RE_GS_PREFIX + '1108';
		/**推送桌子站起*/
		public static const MATCH_S_UP         :String = NetAction.RE_GS_PREFIX + '1109';        
		/**推送请求带入*/
		public static const MATCH_S_TAKEIN     :String = NetAction.RE_GS_PREFIX + '1111';
		/**收到请求带入*/
		public static const MATCH_TAKEIN       :String = NetAction.TO_GS_PREFIX + '1110';
		/**牌局聊天客户端发*/
		public static const MATCH_CHAT         :String = NetAction.TO_GS_PREFIX + '1112';
		/**牌局服务端推送聊天*/
		public static const MATCH_S_CHAT       :String = NetAction.RE_GS_PREFIX + '1113';
		/**牌局打赏客户端发*/
		public static const MATCH_SEND_GIFT    :String = NetAction.TO_GS_PREFIX + '1114';
		/**牌局服务端推送打赏*/
		public static const MATCH_S_SEND_GIFT  :String = NetAction.RE_GS_PREFIX + '1115';
		/**牌局亮牌*/
		public static const MATCH_SHOW_CARD    :String = NetAction.TO_GS_PREFIX + '1117';
		/**牌局内玩家银子变化 */
		public static const MATCH_MONEY_CHANGE :String = NetAction.RE_GS_PREFIX + '1118';
		/**站起围观后发送心跳 */
		public static const MATCH_HEART_BEAT   :String = NetAction.TO_GS_PREFIX + '1119';
		/**私人房开启数据统计  (c->s)*/
		public static const MATCH_OPEN_INFO    :String = NetAction.TO_GS_PREFIX + '1120';	
		/** 获取数据统计(c->s)*/
		public static const MATCH_GET_INFO     :String = NetAction.TO_GS_PREFIX + '1121';
		/**收到数据统计(S->C) */
		public static const MATCH_S_GET_INFO   :String = NetAction.RE_GS_PREFIX + '1122';
		/**服务端推送修改过的前注额  (c->s)*/
		public static const MATCH_ANTE         :String = NetAction.RE_GS_PREFIX + '1124';
		/** 是否在房间(c->s)*/
		public static const MATC_IN_TABLE      :String = NetAction.TO_GS_PREFIX + '1127';	
		/** 是否在房间(S->C)*/
		public static const MATC_S_IN_TABLE    :String = NetAction.RE_GS_PREFIX + '1128';
		/**被托管(S->C) */
		public static const MATC_S_IS_TRUSTEE  :String = NetAction.RE_GS_PREFIX + '1129';	
		/** 房间坐下*/
		public static const MATCH_SIT          :String = NetAction.TO_GS_PREFIX + "2002";
		/** 离开房间*/
		public static const MATCH_OUT          :String = NetAction.TO_GS_PREFIX + "2003";
		// /** 创建房间 */
		//public public static const MATCH_CREATE       :String = NetAction.TO_GS_PREFIX + "2004";
		/**房间站起*/
		public static const MATCH_UP           :String = NetAction.TO_GS_PREFIX + "1116";
		/**房主开始*/
		//public public static const MATCH_START        :String = NetAction.TO_GS_PREFIX + "2008";
		/**牌局结束*/
		public static const PUSH_DISMISS_TABLE :String = NetAction.TO_GS_PREFIX + "2106";
		/**推送进入桌子*/
		public static const MATCH_S_ADDTABLE   :String = NetAction.RE_GS_PREFIX +'2101';      
		// /**推送离开桌子**/
		//public public static const MATCH_S_OUTTABLE   :String = NetAction.RE_GS_PREFIX +'2102';     
		/**修改个人标签信息*/
		public static const MODIFY_LABEL_INFO :String = NetAction.TO_GS_PREFIX + '3002';
		
		/**心跳(c->s) */
		public static const GLXY_REQ_HEART_BEAT :String = NetAction.TO_GS_PREFIX + '10000';        
		/** 下注(c->s)*/
		public static const GLXY_REQ_ANTE :String = NetAction.TO_GS_PREFIX + '10001';			
		/**上庄(c->s) */
		public static const GLXY_REQ_BECOME_BANKER :String = NetAction.TO_GS_PREFIX + '10002';		
		/**下庄(c->s) */
		public static const GLXY_REQ_CHANGE_BANKER :String = NetAction.TO_GS_PREFIX + '10003';	
		/**桌面位置坐下(c->s) */
		public static const GLXY_REQ_ADD_SHOW_POS :String = NetAction.TO_GS_PREFIX + '10004';
		/**桌面位置站起(c->s) */
		public static const GLXY_REQ_SUB_SHOW_POS  :String = NetAction.TO_GS_PREFIX + '10005';
		
		/**历史输赢(c->s) */
		public static const GLXY_REQ_WIN_HISTORY  :String = NetAction.TO_GS_PREFIX + '10006';
		
		/**下注(s->c) */
		public static const GLXY_RESP_ANTE :String = NetAction.RE_GS_PREFIX + '20001';				
		/**上庄(s->c) */
		public static const GLXY_RESP_BECOME_BANKER :String = NetAction.RE_GS_PREFIX + '20002';	
		/**下庄(s->c) */
		public static const GLXY_RESP_CHANGE_BANKER :String = NetAction.RE_GS_PREFIX + '20003';	
		/**桌子信息(s->c) */
		public static const GLXY_RESP_TABLE_VO :String = NetAction.RE_GS_PREFIX + '20004';			
		/**有人进入(s->c) */
		public static const GLXY_RESP_PLAYER_ENTER :String = NetAction.RE_GS_PREFIX + '20005';		
		/**有人离开(s->c) */
		public static const GLXY_RESP_PLAYER_LEAVE :String = NetAction.RE_GS_PREFIX + '20006';		
		/**游戏结算(s->c) */
		public static const GLXY_RESP_GAME_END :String = NetAction.RE_GS_PREFIX + '20008';
		/**游戏开始(s->c)*/
		public static const GLXY_RESP_GAME_START :String = NetAction.RE_GS_PREFIX + '20007';
		/**上庄列表(s->c) */
		public static const GLXY_RESP_BANK_WAITER :String = NetAction.RE_GS_PREFIX + '20009';
		/**桌面位置坐下(s->c) */
		public static const GLXY_RESP_ADD_SHOW_POS :String = NetAction.RE_GS_PREFIX + '20010';
		/**桌面位置站起(s->c) */
		public static const GLXY_RESP_SUB_SHOW_POS :String = NetAction.RE_GS_PREFIX + '20011';
		/**欢乐城聊天客户端发*/
		public static const GLXY_REQ_CHAT    :String = NetAction.TO_GS_PREFIX + '10007';
		/**欢乐城服务端推送聊天*/
		public static const GLXY_RESP_CHAT       :String = NetAction.RE_GS_PREFIX + '20013';
		/**历史输赢(s->c)*/
		public static const GLXY_RESP_WIN_HISTORY :String = NetAction.RE_GS_PREFIX + '20012';
		/**猜手牌(C->S */
		public static const GLXY_MESSAGEVO_REQ_GUESS_CARD :String = NetAction.TO_GS_PREFIX +'1130';
		/***猜手牌(S->C) */
		public static const GLXY_MESSAGEVO_RESP_GUESS_CARD :String = NetAction.RE_GS_PREFIX + '1131';
		/**猜手牌获奖(S->C) */
		public static const GLXY_MESSAGEVO_RESP_GUESS_CARD_WIN :String = NetAction.RE_GS_PREFIX + '1132';
		
		
		
		
		
		
		
		
		
		
		
		
		/**奖池 */
		public static const BULLETIN :String = "BULLETIN";
		/**公告信息*/
		public static const NOTICE_ADD       :String   = '31000';
		public static const NOTICE_DEL       :String   = '31001';
		public static const NOTICE_GET       :String   = '31002';
		public static const NOTICE_GET_MANY  :String   = '31003';
		/**新邮件数*/
		public static const IMS_READ_NUM       :String = "31012";
		/**获取邮件*/
		public static const IMS_GETS           :String = "31011";
		/**读邮件*/
		public static const IMS_READ           :String = "31013"; 
		
		/**保存收藏牌局*/
		public static const DZ_RECORD_ADD      :String = "31004";//加
		public static const DZ_RECORD_DEL      :String = "31005";//删
		public static const DZ_RECORD_GET      :String = "31006";
		public static const DZ_RECORD_GET_MANY :String = "31007";//获取全部
		
		/**举报*/
		public static const DZ_FEEDBACK_ADD    :String = "31008";
		/**获取收藏录像数据 */
		public static const DZ_RECODE_GETVO    :String = "31009";
		/**获取举报录像数据 */
		public static const DZ_FEEDBACK_GETVO  :String = "31010";
		
		/**头像*/
		public static const GET_HEAD_INFO   :String = NetAction.TO_MS_PREFIX + "001";
		public static const RE_GET_HEAD_INFO:String = NetAction.RE_MS_PREFIX + "001";
		
		public static const PROCESS_XYID_REQ_GET_USER_LIST   :String = NetAction.TO_MS_PREFIX + "017";//查看玩家数据
		public static const PROCESS_XYID_RESP_GET_USER_LIST  :String = NetAction.RE_MS_PREFIX + "017";//查看玩家数据
		
		public static const SET_HEAD_INFO   :String = NetAction.TO_MS_PREFIX + "002";//设置
		public static const RE_SET_HEAD_INFO:String = NetAction.RE_MS_PREFIX + "002";//设置
		
		public static const SET_PLAY_INFO   :String = NetAction.TO_MS_PREFIX + "003";//查看玩家数据
		public static const RE_SET_PLAY_INFO:String = NetAction.RE_MS_PREFIX + "003";//查看玩家数据
		
		public static const REQ_DI_BAO :String  = "12049";
		public static const RESP_AWARD_INFO :String  = "12046";
		
		public static const BUY_SILVER :String = "400"; 
		public static const BUY_VIP :String = "401";
		
		//好友
		public static const REQ_GET_USER_FRIEND :String = "21004";               //获得用户好友
		public static const RESP_GET_USER_FRIEND :String = "22004";              //获得用户好友返回
		public static const REQ_SEARCH_USER_FRIEND :String = "21005";            //搜索用户ID
		public static const RESP_SEARCH_USER_FRIEND :String = "22005";           //搜索用户ID返回
		public static const REQ_ADD_USER_FRIEND_REQUEST :String = "21006";       //添加好友申请
		public static const RESP_ADD_USER_FRIEND_REQUEST :String = "22006";      //添加好友申请返回
		public static const REQ_ADD_USER_FRIEND_DELETE :String = "21008";        //删除好友
		public static const RESP_ADD_USER_FRIEND_DELETE :String = "22008";       //删除好友返回
		public static const REQ_ADD_USER_FRIEND :String = "21009";               //同意添加好友
		public static const RESP_ADD_USER_FRIEND :String = "22009";              //同意添加好友返回
		public static const REQ_ADD_USER_FRIEND_FACE2FACE :String = "21007";     //面对面加好友
		public static const RESP_ADD_USER_FRIEND_FACE2FACE :String = "22007";    //面对面加好友返回
		public static const REQ_GET_USER_FRIEND_REQUEST :String = "21010";       //获得好友申请列表
		public static const RESP_GET_USER_FRIEND_REQUEST :String = "22010";      //获得好友申请列表返回
		public static const REQ_ADD_FACE2FACE_FRIEND :String = "21011";          //互加好友
		public static const RESP_ADD_FACE2FACE_FRIEND :String = "22011";         //互加好友返回
		public static const REQ_INVITE_FRIEND :String = "21012";                 //邀请好友
		public static const RESP_INVITE_FRIEND :String = "22012";                //邀请好友返回
		public static const REQ_REFUSE_ADD_FRIEND :String = "21013";             //拒绝添加好友
		public static const RESP_REFUSE_ADD_FRIEND :String = "22013";            //拒绝添加好友返回
		
		public static const REQ_CHANGE_USER_STATUS :String = "21015";            //更改玩家状态
		public static const RESP_CHANGE_USER_STATUS :String = "22015";           //更改玩家状态返回
		
		public static const GAME_CONFIG:String = "31015";                //获取登陆前游戏
		public static const GAME_LOGIN:String = "31016";                //登陆
		public static const GAME_LOGOUT:String   = "31017";               //离开
		public static const GOGO_NOTICE_GET_MANY :String = "31018";        //播放跑马灯
		public static const GOGO_NOTICE_GET_REFLUSH:String   = "22016";   //游戏内自定模块推
		
		public static const REQ_BILL_GET: String  = "21014";              //账单
		public static const RESP_BILL_GET: String  = "22014";             //账单返回
		
		
		
		
		// --- 以下荷官操作 start ---
		/**
		 * 流程为：1(正常); 2(发牌异常); 3(重新发牌)
		 * 1: SERVER->DEALER:[3001]; DEALER->SERVER:[2001]; DEALER->SERVER:[2002]; SERVER->DEALER:[3002];
		 * 2: SERVER->DEALER:[3001]; DEALER->SERVER:[2001]; SERVER->DEALER:[3003]; 这里直接跳到3
		 * 3: DEALER->SERVER:[2003]; SERVER->DEALER:[3004];
		 */
		/** 荷官告诉服务器 要开始发牌了 */
		public static const DTS_START_DEAL_CARD: String = NetAction.TO_GS_PREFIX + "2001";
		/** 荷官告诉服务器 每个座位具体的牌面数据，不同参数对应不同牌类型 [0手牌 1翻牌 2转牌 3河牌] */
		public static const DTS_CARD_DATA: String = NetAction.TO_GS_PREFIX + "2002";
		/** 荷官告诉服务器 荷官主动要求重新发牌 */
		public static const DTS_REPEAT_DEAL_CARD: String = NetAction.TO_GS_PREFIX + "2003";
		
		/** 服务器告诉荷官 可以发牌了 */
		public static const STD_CAN_START_DEAL_CARD:String = NetAction.RE_GS_PREFIX + '3001';
		/** 服务器告诉荷官 发牌结束，即：小型机停止检查牌面 */
		public static const STD_DEAL_CARD_END:String = NetAction.RE_GS_PREFIX + '3002';
		/** 服务器告诉荷官 发牌异常，可以准备重新发牌了 */
		public static const STD_DEAL_CARD_ERROR:String = NetAction.RE_GS_PREFIX + '3003';
		/** 服务器告诉荷官 收到重新发牌处理，同意荷官重新发牌，并且通知玩家清空桌面 */
		public static const STD_CAN_REPEAT_DEAL_CARD:String = NetAction.RE_GS_PREFIX + '3004';
		
		// --- end
		
		
	}
}
