import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodeLoginStepOneController extends GetxController {
  RxBool isChecked = false.obs;
  // 手机号输入框控制器
  final TextEditingController phoneController = TextEditingController();
  // 密码输入框控制器
  final TextEditingController passwordController = TextEditingController();

  get checked => null;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void selectCheckbox() {
    isChecked.value = !isChecked.value;
    print(isChecked.value);
    update();
  }

  void subLogin() {
    print(phoneController.text);
    print(passwordController.text);
  }
}
