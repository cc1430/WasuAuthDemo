import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:flutterauthdemo/listener/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';
import 'package:wasuauthsdk/bean/user_info.dart';


///注册
class RegisterPage extends StatefulWidget {
  var _title;
  @override
  State<StatefulWidget> createState() {
    return RegisterState(_title);
  }

  RegisterPage(this._title);
}

class RegisterState extends State {
  var _title;
  TextEditingController nickNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verCodeController = TextEditingController();

  RegisterState(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "昵称:",
              ),
              controller: nickNameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "手机号:",
              ),
              controller: phoneController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码:",
              ),
              controller: passwordController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "验证码:",
              ),
              controller: verCodeController,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("发送验证码"),
                  onPressed: ()=>{
                    _sendSmsCode()
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  child: Text("注册"),
                  onPressed: ()=>{
                    _commit()
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _commit() {
    print("提交注册");
    UserInfo userInfo = UserInfo();
    userInfo.nickName = nickNameController.text;
    userInfo.phone = phoneController.text;
    userInfo.password = passwordController.text;
    userInfo.verCode = verCodeController.text;
    WasuUrsAuth.getInstance().register(userInfo, resultListener: DialogResultListener(context));
  }

  void _sendSmsCode() {
    print("发送验证码");
    WasuUrsAuth.getInstance().sendSMSCode(phoneController.text, resultListener: MyListener());
  }

}