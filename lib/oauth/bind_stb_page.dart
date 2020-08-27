import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///手机绑定机顶盒
class BindStbPage extends StatefulWidget {
  var _title;

  BindStbPage(this._title);

  @override
  _BindStbPageState createState() => _BindStbPageState(_title);
}

class _BindStbPageState extends State<BindStbPage> {
  var _title;

  _BindStbPageState(this._title);

  TextEditingController tokenController = TextEditingController();
  TextEditingController stbIdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController optController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Column(
          children: <Widget>[
            _getTextField("Token：", tokenController),
            _getTextField("机顶盒号：", stbIdController),
            _getTextField("手机号：", phoneController),
            _getTextField("操作类型：", optController),
            RaisedButton(
              child: Text("确认"),
              onPressed: (){
                _opt();
              },
            )
          ],
        )
    );
  }

  TextField _getTextField(String label, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
          labelText: label
      ),
      controller: controller,
    );
  }

  void _opt() {
    WasuUrsAuth.getInstance().bindStbId(tokenController.text, stbIdController.text, phoneController.text,
        optController.text, resultListener: MyListener());
  }
}
