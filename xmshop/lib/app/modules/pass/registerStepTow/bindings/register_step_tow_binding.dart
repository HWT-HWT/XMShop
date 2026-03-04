import 'package:get/get.dart';

import '../controllers/register_step_tow_controller.dart';

class RegisterStepTowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterStepTowController>(
      () => RegisterStepTowController(),
    );
  }
}
