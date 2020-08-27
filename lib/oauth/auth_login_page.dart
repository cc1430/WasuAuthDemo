import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///手机授权登录
class AuthLoginPage extends StatefulWidget {
  var _title;

  AuthLoginPage(this._title);

  @override
  _AuthLoginPageState createState() => _AuthLoginPageState(_title);
}

TextField _getTextField(String label, TextEditingController controller) {
  return TextField(
    decoration: InputDecoration(
        labelText: label
    ),
    controller: controller,
  );
}

class _AuthLoginPageState extends State<AuthLoginPage> {
  var _title;
  var _qrCodeIdController = TextEditingController();
  var _tokenController = TextEditingController();

  _AuthLoginPageState(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _getTextField("二维码编号：", _qrCodeIdController),
            _getTextField("AccessToken：", _tokenController),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: ()=>{
                _commit()
              },
              child: Text("提交"),
            )
          ],
        ),
      ),
    );
  }

  void _commit() {
    WasuUrsAuth.getInstance().callAuthLogin(_qrCodeIdController.text, _tokenController.text, resultListener: DialogResultListener(context));
  }
}
