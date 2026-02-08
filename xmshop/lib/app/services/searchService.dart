import 'storage.dart';

class SearchService {
  // 保存搜索历史记录
  static setHistoryData(keywords) async {
    List? setHistoryListData =  await Storage.getData('searchList');

    if(setHistoryListData!=null){
      var hasData = setHistoryListData.any((e){
        return e == keywords;
      });
      if(!hasData){
        setHistoryListData.add(keywords);
        await Storage.setData('searchList', setHistoryListData);
      }
    } else{
      List tempList = [];
      tempList.add(keywords);
      await Storage.setData('searchList', tempList);
    }
  }

  // 获取搜索历史记录
  static Future<List> getHistoryData()async{
    List? searchListData = await Storage.getData('searchList');
    if (searchListData != null) {
      return searchListData;
    }else{
      return [];
    }
  }

  // 删除历史记录
  static deleteHistoryData(keywords) async {
     List? searchListData = await Storage.getData('searchList');
     if (searchListData !=null) {
        Storage.removeData(keywords);
        await Storage.setData('searchList', searchListData);
     }else{
       return [];
     }
  }

  // 清空历史记录
  static clearAllHistoryData() async {
     Storage.clear('searchList');
  }

}

