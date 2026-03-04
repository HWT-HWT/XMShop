import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_step_tow_controller.dart';

class RegisterStepTowView extends GetView<RegisterStepTowController> {
  const RegisterStepTowView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterStepTowView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RegisterStepTowView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
