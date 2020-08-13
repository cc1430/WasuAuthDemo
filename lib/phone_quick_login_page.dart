import 'package:flutter/material.dart';
import 'package:flutterauthdemo/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';

class PhoneQuickLoginPage extends StatefulWidget {
  @override
  _PhoneQuickLoginPageState createState() => _PhoneQuickLoginPageState();
}

class _PhoneQuickLoginPageState extends State<PhoneQuickLoginPage> {
  TextEditingController tokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("本机号码快捷登录"),
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
    WasuUrsAuth.getInstance().callPhoneQuickLogin(tokenController.text, resultListener: MyListener());
  }
}
