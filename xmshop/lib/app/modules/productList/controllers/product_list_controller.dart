import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../models/plist_model.dart';
import '../../../services/httpsClient.dart';

class ProductListController extends GetxController {
  // 滚动事件
  ScrollController scrollController = ScrollController();

  // 排序
  RxString sort = ''.obs;

  //页码
  RxInt page = 1.obs;
  // 数据列数
  RxInt pageSize = 8.obs;
  // 商品列表数据
  RxList plist = [].obs;
  // 防止一个地址请求多吃  防抖
  bool flag = true;
  // 检测是否加载全部数据
  RxBool hasData = true.obs;

  // 页面 globalKey 实现右侧筛选
  GlobalKey<ScaffoldState> scaffoldglobalKey = GlobalKey<ScaffoldState>();

  // 自定义封装请求
  HttpsClient httpsClient = HttpsClient();

  RxInt subHeaderListIdSort = 0.obs;

  // 二级分类地址
  List subHeaderList = [
    {"id": 1, 'title': '综合', 'fileds': 'all', "sort": 1},
    {"id": 2, 'title': '销量', 'fileds': 'salecount', "sort": -1},
    {"id": 3, 'title': '价格', 'fileds': 'price', "sort": -1},
    {"id": 4, 'title': '筛选'},
  ];

  // 二级筛选判断
  RxInt selectHeaderId = 1.obs;

  @override
  void onInit() {
    super.onInit();
    initScrollContorller();
    getPlistData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 切换二级导航
  void setSelectHeaderId(int id) {
    // 改变二级导航选中
    selectHeaderId.value = id;

    // 改变排序
    sort.value =
        '${subHeaderList[id - 1]['fileds']}_${subHeaderList[id - 1]['sort']}';

    // 重置页码
    page.value = 1;

    //
    hasData.value = true;

    // 重置数据
    plist.value = [];

    // 页面滚动到最上方
    scrollController.jumpTo(0);

    // 重新请求
    getPlistData();

    // 右侧筛选
    id == 4 ? scaffoldglobalKey.currentState!.openEndDrawer() : null;

    // 切换排序
    subHeaderList[id - 1]['sort'] = subHeaderList[id - 1]['sort'] * -1;

    subHeaderListIdSort.value = subHeaderList[id - 1]['sort'];

    update();
  }

  //下拉刷新
  void initScrollContorller() {
    scrollController.addListener(() {
      // scrollController.position.pixels  滚动条下拉的高度
      // scrollController.position.maxScrollExtent  页面高度
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 30) {
        if (flag) {
          getPlistData();
        }
      }
    });
  }

  // 获取商品列表数据
  void getPlistData() async {
    if (hasData.value) {
      print(
        'api/plist?cid=${Get.arguments['cid']}&page=$page&pageSize=$pageSize&sort=$sort',
      );
      flag = false;
      var response = await httpsClient.get(
        'api/plist?cid=${Get.arguments['cid']}&page=$page&pageSize=$pageSize&sort=$sort',
      );

      if (response != null) {
        var plistTemp = PlistModel.fromJson(response.data!);
        plist.addAll(plistTemp.result!);
        page++;
        flag = true;
        if (plistTemp.result!.length < pageSize.value) {
          hasData.value = false;
        }
        update();
      }
    }
  }
}
