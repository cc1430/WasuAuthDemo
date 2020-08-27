import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///用户名密码登录
class PswLoginPage extends StatefulWidget {
  var _title;

  PswLoginPage(this._title);

  @override
  _PswLoginPageState createState() => _PswLoginPageState(_title);
}

class _PswLoginPageState extends State<PswLoginPage> {
  var _title;

  _PswLoginPageState(this._title);

  TextEditingController pswController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

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
    WasuUrsAuth.getInstance().callPwdLogin(userNameController.text, pswController.text, resultListener: DialogResultListener(context));
  }
}
