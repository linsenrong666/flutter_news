import 'package:localstorage/localstorage.dart';

import '../values/storage.dart';

/// 本地存储
/// 单例 StorageUtil().getItem('key')
class StorageUtils {
  static final StorageUtils _singleton = StorageUtils._internal();
  late LocalStorage _storage;

  factory StorageUtils() {
    return _singleton;
  }

  StorageUtils._internal() {
    _storage = LocalStorage(STORAGE_MASTER_KEY);
  }

  String getItem(String key) {
     var item = _storage.getItem(key);
     if(item == null){
       return '';
     }
     return item;
  }

  Future<void> setItem(String key, String val) async {
    await _storage.setItem(key, val);
  }
}
