import 'package:flutter/material.dart';
import 'package:flutter_news/pages/index/index_page.dart';
import 'package:flutter_news/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';

void main() async {

  await Global.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812 - 44 - 34),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: child,
          routes: staticRoutes,
        );
      },
      child: const IndexPage(),
    );
  }
}
