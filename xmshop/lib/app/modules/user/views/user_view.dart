import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/screebAdapter.dart';

import '../controllers/user_controller.dart';
import '../../../services/ityingFont.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});

  Widget _login() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            left: ScreenAdapter.width(40),
            right: ScreenAdapter.width(30),
          ),
          width: ScreenAdapter.width(140),
          height: ScreenAdapter.width(140),
          child: CircleAvatar(
            radius: ScreenAdapter.width(75),
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed('/code-login-step-one');
          },
          child: Text(
            '登录/注册',
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(50),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          width: ScreenAdapter.width(20),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: ScreenAdapter.fontSize(34),
          color: Colors.black54,
        )
      ],
    );
  }

  Widget _money() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenAdapter.heigth(40),
        bottom: ScreenAdapter.heigth(40),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('-'),
                Text('米金'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('-'),
                Text('米金'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('-'),
                Text('米金'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text('-'),
                Text('米金'),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Icon(Icons.import_contacts),
                Text('钱包'),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 第一个横幅广告
  Widget _banner1(String image) {
    return Padding(
      padding: EdgeInsetsGeometry.all(ScreenAdapter.width(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        height: ScreenAdapter.heigth(280),
      ),
    );
  }

  Widget settingTab() {
    return Container(
      width: ScreenAdapter.width(1000),
      padding: EdgeInsets.all(ScreenAdapter.heigth(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ScreenAdapter.width(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(ScreenAdapter.width(20)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.fromLTRB(
                        right: BorderSide(width: 1, color: Colors.black12),
                      ),
                    ),
                    child: Text(
                      '收藏',
                      style: TextStyle(color: Colors.black12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: BoxBorder.fromLTRB(
                        right: BorderSide(width: 1, color: Colors.black12),
                      ),
                    ),
                    child: Text(
                      '足迹',
                      style: TextStyle(color: Colors.black12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Text(
                      '关注',
                      style: TextStyle(color: Colors.black12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenAdapter.heigth(20),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(Icons.bookmarks_outlined),
                    Text('待付款'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(Icons.car_crash),
                    Text('待收货'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(Icons.question_answer_outlined),
                    Text('待评价'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(Icons.design_services_outlined),
                    Text('退换/售后'),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Icon(Icons.copy_all_rounded),
                    Text('全部订单'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget userGory() {
    return Container(
      width: ScreenAdapter.width(1000),
      margin: EdgeInsets.only(top: ScreenAdapter.heigth(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ScreenAdapter.width(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(ScreenAdapter.heigth(30)),
                child: Text("服务",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: ScreenAdapter.fontSize(44),
                        fontWeight: FontWeight.bold)),
              ),
              const Text(
                "更多 > ",
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
          GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1.25,
            crossAxisCount: 4,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    ItyingIcon.anzhuang,
                    color: Colors.blue,
                  ),
                  Text("一键安装")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    ItyingIcon.tuihuanhuo,
                    color: Colors.blue,
                  ),
                  Text("一键退换")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(ItyingIcon.weixiu, color: Colors.purple),
                  Text("一键维修")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(ItyingIcon.schedule, color: Colors.purple),
                  Text("服务进度")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    ItyingIcon.xiaomi,
                    color: Colors.orange,
                  ),
                  Text("小米之家")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    ItyingIcon.kefu,
                    color: Colors.orange,
                  ),
                  Text("客服中心")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    ItyingIcon.duihuan,
                    color: Colors.green,
                  ),
                  Text("以旧换新")
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(
                    ItyingIcon.chongdian,
                    color: Colors.green,
                  ),
                  Text("手机电池")
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  // 第二个横幅广告
  Widget _banner2(String image) {
    return Padding(
      padding: EdgeInsetsGeometry.all(ScreenAdapter.width(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        height: ScreenAdapter.heigth(280),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Text('会员码'),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
          IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          IconButton(onPressed: () {}, icon: Icon(Icons.message))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        width: ScreenAdapter.width(1080),
        child: ListView(
          children: [
            Column(
              children: [
                _login(),
                _money(),
                _banner1('assets/images/user_ad1.png'),
                settingTab(),
                userGory(),
                _banner2('assets/images/user_ad2.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
