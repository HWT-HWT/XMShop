import 'package:get/get.dart';

import '../controllers/code_login_step_tow_controller.dart';

class CodeLoginStepTowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CodeLoginStepTowController>(
      () => CodeLoginStepTowController(),
    );
  }
}
