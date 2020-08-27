import 'package:fluttertoast/fluttertoast.dart';
import 'package:wasuauthsdk/auth/result_listener.dart';

class MyListener implements ResultListener {
  @override
  void onError(String error) {
    print("请求错误：$error");
    Fluttertoast.showToast(msg: error);
  }

  @override
  void onFail(String msg) {
    print("请求失败：$msg");
    Fluttertoast.showToast(msg: msg);
  }

  @override
  void onSuccess(String data) {
    print("请求成功：$data");
    Fluttertoast.showToast(msg: data);
  }

}