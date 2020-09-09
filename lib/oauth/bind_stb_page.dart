import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
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
  TextEditingController clientIdController = TextEditingController();
  TextEditingController clientSecretController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: <Widget>[
            new SliverPadding(
              padding: EdgeInsets.all(5),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                    <Widget>[
                      _getTextField("机顶盒号：", stbIdController),
                      _getTextField("手机号：", phoneController),
                      _getTextField("操作类型：", optController),
                      _getTextField("Token：", tokenController, hint: "选填"),
                      _getTextField("ClientId：", clientIdController, hint: "选填"),
                      _getTextField("ClientSecret：", clientSecretController, hint: "选填"),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Text("确认"),
                            onPressed: (){
                              _opt();
                            },
                          )
                        ],
                      )
                    ]
                ),
              ),
            )
          ],
        )
    );
  }

  TextField _getTextField(String label, TextEditingController controller, {String hint}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
      controller: controller,
    );
  }

  void _opt() {
    WasuUrsAuth.getInstance().bindStbId(stbIdController.text, phoneController.text,
        optController.text, resultListener: DialogResultListener(context), token: tokenController?.text,
        clientId: clientIdController?.text, clientSecret: clientSecretController?.text);
  }
}
