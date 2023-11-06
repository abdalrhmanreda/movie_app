import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

class HiveCache {
  static Box? myBox;
  static openHive() async {
    if (!Hive.isBoxOpen('localDB')) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    myBox = await Hive.openBox('localDB');
  }

  static saveData({required String key, required dynamic value}) async {
    myBox!.put(key, value);
  }

  static getData({required String key}) {
    return myBox!.get(key);
  }
}
