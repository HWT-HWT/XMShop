import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static double width(double v) {
    return v.w;
  }

  static double heigth(double v) {
    return v.h;
  }

  static double fontSize(double v) {
    return v.sp;
  }

  static double getScreenWdith() {
    return 1.sw;
  }

  static double getScreenHeigth() {
    return 1.sh;
  }
}
