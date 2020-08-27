import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:flutterauthdemo/listener/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///验证码登录
class SmsCodeLoginPage extends StatefulWidget {
  var _title;

  SmsCodeLoginPage(this._title);

  @override
  _SmsCodeLoginPageState createState() => _SmsCodeLoginPageState(_title);
}

class _SmsCodeLoginPageState extends State<SmsCodeLoginPage> {
  var _title;
  TextEditingController phoneController = TextEditingController();
  TextEditingController verCodeController = TextEditingController();

  _SmsCodeLoginPageState(this._title);

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
    WasuUrsAuth.getInstance().callSMSCodeLogin(phoneController.text, verCodeController.text, resultListener: DialogResultListener(context));
  }
}
