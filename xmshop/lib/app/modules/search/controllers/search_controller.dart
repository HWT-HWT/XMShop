import 'package:get/get.dart';
import '../../../services/searchService.dart';
import '../../../services/storage.dart';

class SearchControllers extends GetxController {

  RxString keywords = ''.obs;

  RxList historyList =[].obs;

  @override
  void onInit() {
    super.onInit();
    getHistoryData();
  }


  @override
  void onClose() {
    super.onClose();
  }

  getHistoryData() async{
    var templist = await SearchService.getHistoryData();

    if(templist.isNotEmpty){
      historyList.value = templist;
      print(historyList);
      update();
    }
  }

  clearHistoryData() async{
    await SearchService.clearAllHistoryData();
    historyList.value = [];
    update();
  }

  removeHistoryData(keywords) async{
    var tempList = await  SearchService.getHistoryData();
    if(tempList.isNotEmpty){
      tempList.remove(keywords);
      await Storage.setData('searchList',tempList);
      historyList.remove(keywords);
      update();
    }
  }
}
