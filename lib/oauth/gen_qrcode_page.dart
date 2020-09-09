import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';


///获取二维码
class GenQrCodePage extends StatefulWidget {
  var _title;

  GenQrCodePage(this._title);

  @override
  _GenQrCodePageState createState() => _GenQrCodePageState(_title);
}

TextField _getTextField(String label, TextEditingController controller) {
  return TextField(
    decoration: InputDecoration(
        labelText: label
    ),
    controller: controller,
  );
}


class _GenQrCodePageState extends State<GenQrCodePage> {
  var _title;
  var _imgUrl = "";

  TextEditingController resNoController = TextEditingController();
  TextEditingController tosController = TextEditingController();

  _GenQrCodePageState(this._title);

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
                      _getTextField("机顶盒号：", resNoController),
                      _getTextField("业务类型：", tosController),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: RaisedButton(
                          child: Text("确认"),
                          onPressed: ()=>{
                            _commit()
                          },
                        ),
                        padding: EdgeInsets.fromLTRB(120, 0, 120, 0),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Image.network(_imgUrl, alignment: Alignment.center),
                    ]
                ),
              ),
            )
          ],
        ),
    );
  }

  void _commit() {
    print("commit");
    int intTos = 1;
    try {
      String tos = tosController.text;
      intTos = int.parse(tos);
    } catch(e) {
      print(e);
      tosController.text = "1";
    }

    if(resNoController.text == "") {
      resNoController.text = "030183762A8BD3A9F4574";
    }

    MyDialogListener myDialogListener = MyDialogListener(context, updateImage);
    WasuUrsAuth.getInstance().getQrCode(resNoController.text, intTos, resultListener: myDialogListener);
  }

  void updateImage(String url) {
    setState(() {
      _imgUrl = url;
    });
  }
}

class MyDialogListener extends DialogResultListener{

  Function(String url) _function;
  MyDialogListener(BuildContext context, Function(String url) f) : super(context) {
    _function = f;
  }

  @override
  void onFail(String msg) {
    super.onFail(msg);
    _function("");
  }

  @override
  void onError(String error) {
    super.onError(error);
    _function("");
  }

  @override
  void onSuccess(String data) {
    super.onSuccess(data);
    Map map = JsonDecoder().convert(data);
    try {
      String url = map["returnedObject"]["imgUrl"];
      _function(url);
    } catch (e) {
      print(e);
    }
  }
}




