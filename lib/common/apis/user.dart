import 'package:dio/dio.dart';
import 'package:flutter_news/common/entities/entities.dart';
import 'package:flutter_news/common/utils/http.dart';

class UserApi {
  static Future<UserLoginResponseEntity> login(
      {required UserLoginRequestEntity params}) async {
    var response = await Http().post('/user/login', params: params);
    return UserLoginResponseEntity.fromJson(response);
  }
}
