import 'package:flutter/material.dart';
import 'package:flutterauthdemo/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';

class SmsCodeLoginPage extends StatefulWidget {
  @override
  _SmsCodeLoginPageState createState() => _SmsCodeLoginPageState();
}

class _SmsCodeLoginPageState extends State<SmsCodeLoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController verCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手机验证码登录（含发送登录验证码）"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
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
                  child: Text("登录"),
                  onPressed: ()=>{
                    _login()
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _sendSmsCode() {
    print("发送验证码");
    WasuUrsAuth.getInstance().sendLoginSMSCode(phoneController.text, resultListener: MyListener());
  }

  void _login() {
    print("登录");
    WasuUrsAuth.getInstance().callSMSCodeLogin(phoneController.text, verCodeController.text, resultListener: MyListener());
  }
}
