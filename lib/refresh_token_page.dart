import 'package:flutter/material.dart';
import 'package:flutterauthdemo/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';

class RefreshTokenPage extends StatefulWidget {
  @override
  _RefreshTokenPageState createState() => _RefreshTokenPageState();
}

class _RefreshTokenPageState extends State<RefreshTokenPage> {
  TextEditingController refreshTokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("刷新Token"),
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
    WasuUrsAuth.getInstance().refreshToken(refreshTokenController.text, resultListener: MyListener());
  }
}
