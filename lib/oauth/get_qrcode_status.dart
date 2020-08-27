import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///查询二维码状态
class GetQrCodeStatusPage extends StatefulWidget {
  var _title;

  GetQrCodeStatusPage(this._title);

  @override
  _GetQrCodeStatusPageState createState() => _GetQrCodeStatusPageState(_title);
}

TextField _getTextField(String label, TextEditingController controller) {
  return TextField(
    decoration: InputDecoration(
        labelText: label
    ),
    controller: controller,
  );
}

class _GetQrCodeStatusPageState extends State<GetQrCodeStatusPage> {
  var _title;
  var qrCodeIdController = TextEditingController();

  _GetQrCodeStatusPageState(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _getTextField("二维码编号：", qrCodeIdController),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              onPressed: ()=>{
                _query()
              },
              child: Text("提交"),
            )
          ],
        ),
      ),
    );
  }

  void _query() {
    WasuUrsAuth.getInstance().checkQrcodeStatus(qrCodeIdController.text, resultListener: DialogResultListener(context));
  }
}
