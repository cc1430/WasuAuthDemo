import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';

class InitPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InitPageSate();
  }
}


class InitPageSate extends State {
  TextEditingController idController = TextEditingController();
  TextEditingController secretController = TextEditingController();
  TextEditingController packageNameController = TextEditingController();

  void initSDK() {
    if(idController.text.isEmpty || secretController.text.isEmpty || packageNameController.text.isEmpty) {
      WasuUrsAuth.getInstance().init("c1", "123");
      Fluttertoast.showToast(msg: "参数不完整，已使用默认值初始化成功！");
      return;
    }
    print("initSDK id = ${idController.text} , secret = ${secretController.text}, packageName = ${packageNameController.text}");
    WasuUrsAuth.getInstance().init(idController.text, secretController.text);
    Fluttertoast.showToast(msg: "初始化成功！");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("初始化"),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: new Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Client Id:",
                  hintText: "c1"
                ),
                controller: idController,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Client Secret:",
                  hintText: "123"
                ),
                controller: secretController,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Package Name:",
                  hintText: "com.android.wasu.enjoytv"
                ),
                controller: packageNameController,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: ()=>{
                  initSDK()
                },
                child: Text(
                    "确认"
                ),
              )
            ],
          )
      ),
    );
  }

}
