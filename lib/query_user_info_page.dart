import 'package:flutter/material.dart';
import 'package:flutterauthdemo/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';

class QueryUserInfoPage extends StatefulWidget {
  @override
  _QueryUserInfoPageState createState() => _QueryUserInfoPageState();
}

class _QueryUserInfoPageState extends State<QueryUserInfoPage> {
  TextEditingController tokenController = TextEditingController();
  TextEditingController uidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("查询用户信息"),
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
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Uid:",
              ),
              controller: uidController,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                onPressed: ()=>{
                  _query()
                },
                child: Text("查询")
            ),
          ],
        ),
      ),
    );
  }

  void _query(){
    print("查询");
    WasuUrsAuth.getInstance().getUserByUid(tokenController.text, uidController.text, resultListener: MyListener());
  }
}
