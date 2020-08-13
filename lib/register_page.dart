import 'package:flutter/material.dart';
import 'package:flutterauthdemo/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';
import 'package:wasuauthsdk/bean/user_info.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }

}

class RegisterState extends State {
  TextEditingController nickNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册（含发送验证码）"),
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

  MyListener myListener = MyListener();

  void _commit() {
    print("提交注册");
    UserInfo userInfo = UserInfo();
    userInfo.nickName = nickNameController.text;
    userInfo.phone = phoneController.text;
    userInfo.password = passwordController.text;
    userInfo.verCode = verCodeController.text;
    WasuUrsAuth.getInstance().register(userInfo, resultListener: myListener);
  }

  void _sendSmsCode() {
    print("发送验证码");
    WasuUrsAuth.getInstance().sendSMSCode(phoneController.text, resultListener: myListener);
  }

}