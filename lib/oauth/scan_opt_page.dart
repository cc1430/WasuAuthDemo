import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///扫码同步登录
class ScanOptPage extends StatefulWidget {
  var _title;

  ScanOptPage(this._title);

  @override
  _ScanOptPageState createState() => _ScanOptPageState(_title);
}

TextField _getTextField(String label, TextEditingController controller) {
  return TextField(
    decoration: InputDecoration(
        labelText: label
    ),
    controller: controller,
  );
}

class _ScanOptPageState extends State<ScanOptPage> {
  var _title;
  var _qrcodeIdControllder = TextEditingController();
  var _tokenController = TextEditingController();

  _ScanOptPageState(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _getTextField("二维码编码：", _qrcodeIdControllder),
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
    WasuUrsAuth.getInstance().scanOpt(_qrcodeIdControllder.text, _tokenController.text, resultListener: DialogResultListener(context));
  }
}
