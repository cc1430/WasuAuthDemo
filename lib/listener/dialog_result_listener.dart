import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/my_listener.dart';

class DialogResultListener extends MyListener{

  BuildContext _context;

  DialogResultListener(BuildContext buildContext) {
    _context = buildContext;
  }

  @override
  void onError(String error) {
    super.onError(error);
  }

  @override
  void onFail(String msg) {
    super.onFail(msg);
  }

  @override
  void onSuccess(String data) {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("请求成功"),
            content: SingleChildScrollView(
              child: Container(
                  child: Text(data),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("确定"))
            ],
          );
        }
    );
  }
}