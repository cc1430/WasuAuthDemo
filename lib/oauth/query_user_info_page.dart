import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///查询用户信息
class QueryUserInfoPage extends StatefulWidget {
  var _title;
  @override
  _QueryUserInfoPageState createState() => _QueryUserInfoPageState(_title);

  QueryUserInfoPage(this._title);
}

class _QueryUserInfoPageState extends State<QueryUserInfoPage> {
  var _title;

  _QueryUserInfoPageState(this._title);

  TextEditingController tokenController = TextEditingController();
  TextEditingController uidController = TextEditingController();

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
    WasuUrsAuth.getInstance().getUserByUid(tokenController.text, uidController.text, resultListener: DialogResultListener(context));
  }
}
