import 'package:get/get.dart';
import '../../../services/cardService.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  RxList cardList = [].obs;

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
}
