import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///刷新token
class RefreshTokenPage extends StatefulWidget {
  var _title;

  RefreshTokenPage(this._title);

  @override
  _RefreshTokenPageState createState() => _RefreshTokenPageState(_title);
}

class _RefreshTokenPageState extends State<RefreshTokenPage> {
  var _title;
  TextEditingController refreshTokenController = TextEditingController();

  _RefreshTokenPageState(this._title);

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
                labelText: "RefreshToken:",
              ),
              controller: refreshTokenController,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                onPressed: ()=>{
                  _refreshToken()
                },
                child: Text("刷新")
            ),
          ],
        ),
      ),
    );
  }

  void _refreshToken(){
    print("刷新Token");
    WasuUrsAuth.getInstance().refreshToken(refreshTokenController.text, resultListener: DialogResultListener(context));
  }
}
