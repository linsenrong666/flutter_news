import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/values.dart';

Widget iconLogo() {
  return Container(
    width: 76.w,
    height: 76.w,
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular((76 * 0.5).w),
        boxShadow: const [
          Shadows.primaryShadow,
        ]),
    child: Image.asset(
      'assets/images/logo.png',
      fit: BoxFit.none,
    ),
  );
}
