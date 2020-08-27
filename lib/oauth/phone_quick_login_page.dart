import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///手机号快捷登录
class PhoneQuickLoginPage extends StatefulWidget {
  var _title;

  PhoneQuickLoginPage(this._title);

  @override
  _PhoneQuickLoginPageState createState() => _PhoneQuickLoginPageState(_title);
}

class _PhoneQuickLoginPageState extends State<PhoneQuickLoginPage> {
  var _title;
  TextEditingController tokenController = TextEditingController();

  _PhoneQuickLoginPageState(this._title);

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
                labelText: "Token:",
              ),
              controller: tokenController,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                onPressed: ()=>{
                  _login()
                },
                child: Text("登录")
            ),
          ],
        ),
      ),
    );
  }

  void _login(){
    print("登录");
    WasuUrsAuth.getInstance().callPhoneQuickLogin(tokenController.text, resultListener: DialogResultListener(context));
  }
}
