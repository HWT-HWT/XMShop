import 'package:flutter/material.dart';

class LoginModel extends ChangeNotifier {
  final ScrollController _scrollController = ScrollController();

  // 获取私有值
  ScrollController get scrollController => _scrollController;

  bool _flipX = false;

  // 翻转状态管理

  // 获取私有值
  bool get flipX => _flipX;
  // 获取更改私有变量
  set flipX(bool value) {
    _flipX = value;
    notifyListeners();
  }

  bool _flipY = false;

  // 获取私有值
  bool get flipY => _flipY;
  // 获取更改私有变量
  set flipY(bool value) {
    _flipY = value;
    notifyListeners();
  }

  double _size = 200.0;

  // 获取私有值
  double get size => _size;
  // 获取更改私有变量
  set size(double value) {
    _size = value;
    notifyListeners();
  }

  void scrollControllerListtener() {
    print(scrollController.position.pixels);
    scrollController.addListener(() {
      print(scrollController.position.pixels);
    });
  }
}
