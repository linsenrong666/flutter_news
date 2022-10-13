// 登录请求
import 'package:flutter_news/main.dart';

class UserLoginRequestEntity {
  final String username;
  final String password;

  UserLoginRequestEntity({
    required this.username,
    required this.password,
  });

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

// 登录返回
class UserLoginResponseEntity {
  String accessToken;
  String? displayName;
  List<String>? channels;

  UserLoginResponseEntity({
    required this.accessToken,
    this.displayName,
    this.channels,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
    List<String> channels = [];

    if (json.containsKey("channels")) {
      channels = List<String>.from(json["channels"].map((x) => x));
    }

    return UserLoginResponseEntity(
      accessToken: json["accessToken"],
      displayName: json["displayName"],
      channels: channels,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map.putIfAbsent('accessToken', () => accessToken);
    if (displayName != null) {
      map.putIfAbsent('displayName', () => displayName);
    }
    return map;
  }
}
