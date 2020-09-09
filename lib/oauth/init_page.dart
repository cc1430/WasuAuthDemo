import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///初始化
class InitPage extends StatefulWidget {
  var _title;

  @override
  State<StatefulWidget> createState() {
    return InitPageSate(_title);
  }

  InitPage(String title){
    _title = title;
  }
}

class InitPageSate extends State {
  var _title;
  TextEditingController idController = TextEditingController();
  TextEditingController secretController = TextEditingController();
  TextEditingController packageNameController = TextEditingController();

  InitPageSate(this._title);

  void initSDK() async {
    String msg = "初始化成功！";
    if(idController.text.isEmpty || secretController.text.isEmpty || packageNameController.text.isEmpty) {
      idController.text = "c2";
      secretController.text = "123";
      packageNameController.text = "com.android.wasu.enjoytv";
      msg = "已使用默认值初始化成功！";
    }
    print("initSDK id = ${idController.text} , secret = ${secretController.text}, packageName = ${packageNameController.text}");
    WasuUrsAuth.getInstance().init(idController.text, secretController.text, packageNameController.text).setLoggerEnable(true);
    Fluttertoast.showToast(msg: msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: new Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Client Id:",
                  hintText: "c2"
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
