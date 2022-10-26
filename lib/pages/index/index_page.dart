import 'package:flutter/material.dart';
import 'package:flutter_news/global.dart';
import 'package:flutter_news/pages/app/app_main.dart';

import '../sign_in/sign_in.dart';
import '../welcome/welcome.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Global.isFirstOpen
          ? const WelcomePage()
          : Global.isOfflineLogin
              ? const AppMainPage()
              : const SignInPage(),
    );
  }
}
