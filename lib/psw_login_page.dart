

import 'package:flutter/material.dart';
import 'package:flutterauthdemo/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';

class PswLoginPage extends StatefulWidget {
  @override
  _PswLoginPageState createState() => _PswLoginPageState();
}

class _PswLoginPageState extends State<PswLoginPage> {
  TextEditingController pswController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("用户名密码登录"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "用户名:",
              ),
              controller: userNameController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码:",
              ),
              controller: pswController,
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

  void _login() {
    print("登录");
    WasuUrsAuth.getInstance().callPwdLogin(userNameController.text, pswController.text, resultListener: MyListener());
  }
}
