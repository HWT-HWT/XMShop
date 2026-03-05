import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screebAdapter.dart';
import '../controllers/code_login_step_one_controller.dart';
import '../../../../Widget/login.dart';
import '../../../../Widget/input.dart';
import '../../../../Widget/userCheckbox.dart';
import '../../../../Widget/Subbottom.dart';

// 引入状态管理页
class CodeLoginStepOneView extends GetView<CodeLoginStepOneController> {
  const CodeLoginStepOneView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              '帮助',
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: ListViewPage(),
    );
  }
}

class ListViewPage extends GetView<CodeLoginStepOneController> {
  const ListViewPage({super.key});

  // 验证码登录和忘记密码
  Widget register() {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.width(60)),
      width: ScreenAdapter.width(1000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '忘记密码',
            style: TextStyle(color: Colors.black38),
          ),
          Text(
            '验证码登录',
            style: TextStyle(color: Colors.black38),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LogoImage(),
        TextInput('输入手机号', controller.phoneController),
        Obx(
          () => Usercheckbox(
              !controller.isChecked.value, controller.selectCheckbox),
        ),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            controller.subLogin();
          },
          child: SubBottom('验证码登录'),
        ),
        register(),
      ],
    );
  }
}
