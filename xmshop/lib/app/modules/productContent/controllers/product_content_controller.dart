import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/pcontent_model.dart';
import '../../../services/httpsClient.dart';
import '../../../services/screebAdapter.dart';
import '../../../services/cardService.dart';

class ProductContentController extends GetxController {
  // 页面滚动初始化
  final ScrollController scrollController = ScrollController();

  // 请求初始化
  HttpsClient httpsClient = HttpsClient();

  RxDouble opacity = 0.0.obs;

  // 给页面添加key
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();

  // tab栏
  List tabsList = [
    {"id": 1, 'title': '商品'},
    {"id": 2, 'title': '详情'},
    {"id": 3, 'title': '推荐'}
  ];

  // tab切换
  RxInt selectTabsIndex = 1.obs;

  // tab控制器
  RxBool showTabs = false.obs;

  // 商品数据
  final pcontent = PcontentItemModel().obs;

  // 筛选重构数据
  RxList<PcontentAttrModel> pcontentAttr = <PcontentAttrModel>[].obs;

  // 筛选的商品
  RxString selectPcentent = ''.obs;

  // 子分类的位置
  double gk2position = 0;
  double gk3position = 0;

  //第二子分类头部tab栏控制器
  RxBool showSubHeaderTabs = false.obs;

  // 商品详情tab数据
  List subTabList = [
    {'id': 1, 'title': '商品介绍'},
    {'id': 2, 'title': '规格参数'}
  ];
  // 商品详情 tab控制器
  RxInt selectSubTabsIndex = 1.obs;

  // 筛选数据
  RxString selectAttr = ''.obs;

  // 购买数量
  RxInt buyNum = 1.obs;

  @override
  void onInit() {
    super.onInit();
    scrollControllerListtenter();
    getFocuData();
  }

  void scrollControllerListtenter() {
    scrollController.addListener(() {
      //
      if (gk2position == 0 && gk3position == 0) {
        getcontinerPosition(scrollController.position.pixels);
      }

      //显示隐藏详情 subHeader tab切换
      if (scrollController.position.pixels > gk2position &&
          scrollController.position.pixels < gk3position) {
        if (showSubHeaderTabs.value == false) {
          showSubHeaderTabs.value = true;
          selectTabsIndex.value = 2;
        }
      } else if (scrollController.position.pixels > 0 &&
          scrollController.position.pixels > gk2position) {
        if (showSubHeaderTabs.value == true) {
          showSubHeaderTabs.value = false;
          selectTabsIndex.value = 3;
        }
      } else {
        showSubHeaderTabs.value = false;
        selectTabsIndex.value = 1;
      }
      // print(showSubHeaderTabs.value);
      // 显示隐藏顶部tab
      if (scrollController.position.pixels <= 100) {
        opacity.value = scrollController.position.pixels / 100;
        if (scrollController.position.pixels / 100 > 0.9) {
          opacity.value = 1;
        }
        if (showTabs.value == true) {
          showTabs.value = false;
          update();
        }
      } else {
        if (showTabs.value == false) {
          showTabs.value = true;
          update();
        }
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  //tba切换
  void changeSelectedTabsIndex(index) {
    selectTabsIndex.value = index;
    update();
  }

  // 获取商品详情数据
  void getFocuData() async {
    var response =
        await httpsClient.get('api/pcontent?id=${Get.arguments['id']}');

    if (response != null) {
      var tempData = PcontentModel.fromJson(response.data);
      pcontent.value = tempData.result!;
      pcontentAttr.value = pcontent.value.attr!;
      initAttr(pcontentAttr); //初始化attr 重构数据
      setSelectedAtter();
      update();
    }
  }

  // 初始化
  void initAttr(RxList<PcontentAttrModel> attr) {
    for (var i = 0; i < attr.length; i++) {
      for (var j = 0; j < attr[i].list!.length; j++) {
        attr[i].attrList!.add({
          'title': attr[i].list![j],
          'check': j == 0 ? true : false,
        });
      }
    }
  }

  // {
  //   'cate' :'yanse',
  //   attrlist : {
  //     title:'mz'
  //     check:'true'
  //   }
  // }
  // {
  //   'cate' :'banxing',
  //   attrlist : {
  //     title:'mz'
  //     check:'true'
  //   }
  // }

  // 切换筛选
  void changeAttr(dynamic cate, title) {
    for (var i = 0; i < pcontentAttr.length; i++) {
      if (pcontentAttr[i].cate == cate) {
        for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
          pcontentAttr[i].attrList![j]['check'] = false;
          if (pcontentAttr[i].attrList![j]['title'] == title) {
            pcontentAttr[i].attrList![j]['check'] = true;
          }
        }
      }
    }
    update();
  }

  // 获取页面元素位置
  void getcontinerPosition(pixels) {
    // 需要绑定了GlobalKey
    // 获取位置的方法 currentContext!.findRenderObject() as RenderBox;
    RenderBox box2 = gk2.currentContext!.findRenderObject() as RenderBox;
    gk2position =
        box2.localToGlobal(Offset.zero).dy - ScreenAdapter.heigth(120);

    RenderBox box3 = gk3.currentContext!.findRenderObject() as RenderBox;
    gk3position =
        box3.localToGlobal(Offset.zero).dy - ScreenAdapter.heigth(120);
  }

  // 商品详情tab切换
  void changeSubTabs(int id) {
    selectSubTabsIndex.value = id;
    scrollController.jumpTo(gk2position);
    update();
  }

  // 筛选默认值 切换筛选 获取attr属性
  void setSelectedAtter() {
    List tempList = [];
    for (var i = 0; i < pcontentAttr.length; i++) {
      for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
        if (pcontentAttr[i].attrList![j]['check']) {
          tempList.add(pcontentAttr[i].attrList![j]['title']);
        }
      }
    }
    selectAttr.value = tempList.join(',');
    update();
  }

  // 购买数量+1
  void incBuyNum() {
    buyNum++;
    update();
  }

  // 购买数量-1
  void decBuyNum() {
    if (buyNum > 1) {
      buyNum--;
    } else {
      buyNum;
      Get.snackbar("提示?", "商品数量最小为1");
    }
    update();
  }

  //加入购物车
  void addCart() {
    setSelectedAtter();
    CardService.addCard(pcontent.value, selectAttr.value, buyNum.value);
    Get.back();
    Get.snackbar("提示?", "加入购物车成功");
  }
}
