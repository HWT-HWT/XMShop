import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';

import '../controllers/code_login_step_one_controller.dart';

// 引入状态管理页
import './login_model.dart';

class CodeLoginStepOneView extends GetView<CodeLoginStepOneController> {
  const CodeLoginStepOneView({super.key});
  @override
  Widget build(BuildContext context) {
    // 使用 ChangeNotifierProvider 组件
    return ChangeNotifierProvider(
      // 配置 BuildContext context
      create: (BuildContext context) => LoginModel(),
      child: Scaffold(
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
      ),
    );
  }
}

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<LoginModel>();
    return ListView(
      controller: model.scrollController,
      children: [
        InkWell(
          onTap: () {
            model.scrollControllerListtener();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 1000,
              ),
              Login(),
              ControlePanle(),
            ],
          ),
        )
      ],
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // 初始化
    final model = context.watch<LoginModel>();
    return Card(
      child: Transform.flip(
        flipX: model.flipX,
        flipY: model.flipY,
        child: FlutterLogo(
          size: model.size,
        ),
      ),
    );
  }
}

class ControlePanle extends StatefulWidget {
  const ControlePanle({super.key});

  @override
  State<ControlePanle> createState() => _ControlePanleState();
}

class _ControlePanleState extends State<ControlePanle> {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<LoginModel>();
    return Card(
      margin: EdgeInsets.all(32),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('FlipX:'),
                Switch(
                  value: model.flipX,
                  onChanged: (value) {
                    model.flipX = value;
                  },
                ),
                Text('FlipY:'),
                Switch(
                  value: model.flipY,
                  onChanged: (value) {
                    model.flipY = value;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Size:'),
                Slider(
                  min: 50,
                  max: 300,
                  value: model.size,
                  onChanged: (value) {
                    model.size = value;
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
