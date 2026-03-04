import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/code_login_step_tow_controller.dart';

class CodeLoginStepTowView extends GetView<CodeLoginStepTowController> {
  const CodeLoginStepTowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CodeLoginStepTowView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CodeLoginStepTowView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
