import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储
class StorageUtils {
  static final StorageUtils _instance = StorageUtils._();

  factory StorageUtils() => _instance;
  static SharedPreferences? _prefs;

  StorageUtils._();

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// 设置 json 对象
  Future<bool>? setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs?.setString(key, jsonString);
  }

  /// 获取 json 对象
  dynamic getJSON(String key) {
    String? jsonString = _prefs?.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  /// 删除 json 对象
  Future<bool>? remove(String key) {
    return _prefs?.remove(key);
  }
}
