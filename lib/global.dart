import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/entities/entities.dart';
import 'common/utils/utils.dart';
import 'common/values/values.dart';

class Global {
  /// 用户配置
  static UserLoginResponseEntity profile = UserLoginResponseEntity(
    accessToken: '',
    displayName: '',
    channels: [],
  );

  /// 是否第一次打开
  static bool isFirstOpen = false;


  static bool isOfflineLogin = false;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 工具初始
    await StorageUtils.init();

    LogUtils.init(isDebug: true, limitLength: 2000);

    Http();

    // 读取设备第一次打开
    isFirstOpen = !StorageUtils().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtils().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取离线用户信息
    var _profileJSON = StorageUtils().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserLoginResponseEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  // 持久化 用户信息
  static Future<bool>? saveProfile(UserLoginResponseEntity userResponse) {
    profile = userResponse;
    return StorageUtils()
        .setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  }
}
