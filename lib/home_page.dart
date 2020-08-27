import 'package:flutter/material.dart';
import 'package:flutterauthdemo/oauth/auth_login_page.dart';
import 'package:flutterauthdemo/oauth/bind_stb_page.dart';
import 'package:flutterauthdemo/oauth/gen_qrcode_page.dart';
import 'package:flutterauthdemo/oauth/get_qrcode_status.dart';
import 'package:flutterauthdemo/oauth/init_page.dart';
import 'package:flutterauthdemo/oauth/phone_quick_login_page.dart';
import 'package:flutterauthdemo/oauth/psw_login_page.dart';
import 'package:flutterauthdemo/oauth/query_user_info_page.dart';
import 'package:flutterauthdemo/oauth/refresh_token_page.dart';
import 'package:flutterauthdemo/oauth/register_page.dart';
import 'package:flutterauthdemo/oauth/scan_opt_page.dart';
import 'package:flutterauthdemo/oauth/smscode_login_page.dart';
import 'package:flutterauthdemo/oauth/update_user_info_page.dart';
import 'package:flutterauthdemo/video/video_player_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  // 数据源
  List<String> titleItems = <String>[
    "初始化",
    "注册（含发送验证码）",
    "用户名密码登录",
    "手机验证码登录（含发送登录验证码）",
    "本机号码快捷登录",
    "获取二维码",
    "检查二维码状态",
    "手机扫码",
    "二维码授权登录",
    "刷新Token",
    "查询用户信息",
    "修改用户信息",
    "手机绑定机顶盒",
//    "视频播放器",
  ];

  Widget buildListData(BuildContext context, String titleItem) {
    return new ListTile(
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 20, color: Colors.black),
        textAlign: TextAlign.start,
      ),
      onTap: () {
        _enter(titleItems.indexOf(titleItem));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData(context, titleItems[i]));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WasuAuthDemo for flutter",
        )
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return buildListData(context, titleItems[index]);
          },
          separatorBuilder: (context, index) => new Divider(),
          itemCount: titleItems.length
      ),
    );
  }

  void _enter(int index) {
    String title = titleItems[index];
    print("click item = $index, $title");
    switch(index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>InitPage(title)
        ));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>RegisterPage(title)
        ));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>PswLoginPage(title)
        ));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>SmsCodeLoginPage(title)
        ));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>PhoneQuickLoginPage(title)
        ));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>GenQrCodePage(title)
        ));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>GetQrCodeStatusPage(title)
        ));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ScanOptPage(title)
        ));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>AuthLoginPage(title)
        ));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>RefreshTokenPage(title)
        ));
        break;
      case 10:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>QueryUserInfoPage(title)
        ));
        break;
      case 11:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>UpdateUserInfoPage(title)
        ));
        break;
      case 12:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>BindStbPage(title)
        ));
        break;
      case 13:
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>VideoPlayerPage(title)
        ));
        break;
    }
  }
}
