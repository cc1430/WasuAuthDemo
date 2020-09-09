
import 'package:flutter/material.dart';
import 'package:flutterauthdemo/listener/dialog_result_listener.dart';
import 'package:flutterauthdemo/listener/my_listener.dart';
import 'package:wasuauthsdk/auth/wasu_urs_auth.dart';
import 'package:wasuauthsdk/bean/user_info.dart';


///修改用户信息
class UpdateUserInfoPage extends StatefulWidget {
  var _title;

  UpdateUserInfoPage(this._title);

  @override
  _UpdateUserInfoPageState createState() => _UpdateUserInfoPageState(_title);
}

class _UpdateUserInfoPageState extends State<UpdateUserInfoPage> {
  var _title;

  _UpdateUserInfoPageState(this._title);

  TextEditingController tokenController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController uidController = TextEditingController();
  TextEditingController oldPswController = TextEditingController();
  TextEditingController newPswController = TextEditingController();
  TextEditingController verCodeController = TextEditingController();

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
                  _getTextField("Token：", tokenController),
                  _getTextField("昵称：", nickNameController),
                  _getTextField("手机号：", phoneController),
                  _getTextField("Uid：", uidController),
                  _getTextField("原密码：", oldPswController),
                  _getTextField("新密码：", newPswController),
                  _getTextField("验证码：", verCodeController),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("发送验证码"),
                        onPressed: ()=>{
                          _sendSmsCode()
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      RaisedButton(
                        child: Text("修改"),
                        onPressed: ()=>{
                          _update()
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

  TextField _getTextField(String label, TextEditingController controller) {
    return TextField(
      decoration: InputDecoration(
        labelText: label
      ),
      controller: controller,
    );
  }

  void _sendSmsCode() {
    print("发送验证码");
    WasuUrsAuth.getInstance().sendSMSCode(phoneController.text, resultListener: MyListener());
  }

  void _update() {
    print("修改");
    UserInfo userInfo = UserInfo();
    userInfo.nickName = nickNameController.text;
    userInfo.password = newPswController.text;
    userInfo.uid = uidController.text;
    userInfo.oldPassword = oldPswController.text;
    userInfo.verCode = verCodeController.text;
    userInfo.phone = phoneController.text;
    WasuUrsAuth.getInstance().updateUser(tokenController.text, userInfo, resultListener: DialogResultListener(context));
  }
}
