import 'package:get/get.dart';
import '../../../services/cardService.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  // 获取购物车数据
  RxList cardList = [].obs;

  //是否全选
  RxBool cardAllItem = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // 获取本地存储购物车数据
  void getCardList() async {
    var tempList = await CardService.getCardList();
    cardList.value = tempList;
    update();
  }

  // 清空购物车数据
  void closeCardList() async {
    await CardService.clearCardList();
    cardList.value = [];
    update();
  }

  // 购物车商品+1
  void incCartNum(Map cardItem) {
    var tempList = [];
    for (var i = 0; i < cardList.length; i++) {
      if (cardList[i]['_id'] == cardItem['_id'] &&
          cardList[i]['selectedAttr'] == cardItem['selectedAttr']) {
        cardList[i]['count']++;
      }
      tempList.add(cardList[i]);
    }
    cardList.value = tempList;
    CardService.setCartList(tempList);
    update();
  }

  // 购物车商品+1
  void decCartNum(Map cardItem) {
    var tempList = [];
    for (var i = 0; i < cardList.length; i++) {
      if (cardList[i]['_id'] == cardItem['_id'] &&
          cardList[i]['selectedAttr'] == cardItem['selectedAttr']) {
        if (cardList[i]['count'] > 1) {
          cardList[i]['count']--;
        } else {
          Get.snackbar('提示！', "购物车数量已经到最小了");
        }
      }
      tempList.add(cardList[i]);
    }
    cardList.value = tempList;
    CardService.setCartList(tempList);
    update();
  }

  //购物车中每个商品选中按钮
  void changeCardItem(Map cardItem) {
    var tempList = [];
    for (var i = 0; i < cardList.length; i++) {
      if (cardList[i]['_id'] == cardItem['_id'] &&
          cardList[i]['selectedAttr'] == cardItem['selectedAttr']) {
        cardList[i]['checked'] = !cardList[i]['checked'];
      }
      tempList.add(cardList[i]);
    }
    cardList.value = tempList;
    CardService.setCartList(tempList);
    cardAllItem.value = isCheckedAll();
    update();
  }

  // 购物车商品全选按钮
  void changeCardAllItem() {
    var tempList = [];
    for (var i = 0; i < cardList.length; i++) {
      cardList[i]['checked'] = !cardAllItem.value;
      tempList.add(cardList[i]);
    }
    cardList.value = tempList;
    CardService.setCartList(tempList);

    update();
  }

  //判断是否全选
  bool isCheckedAll() {
    if (cardList.isNotEmpty) {
      for (var i = 0; i < cardList.length; i++) {
        if (cardList[i]["checked"] == false) {
          return false;
        }
      }
      return true;
    }
    return false;
  }

  // 全选按钮
  void changeAllButtom() {
    cardAllItem.value = !cardAllItem.value;
    update();
  }
}
