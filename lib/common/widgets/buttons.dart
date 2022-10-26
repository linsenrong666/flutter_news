import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import '../values/values.dart';

Widget flatStyleButton({
  String text = '',
  double width = 140,
  double height = 44,
  required VoidCallback? onPressed,
  Color backgroundColor = AppColors.primaryElement,
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: FlatButton(
      onPressed: onPressed,
      color: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: Radii.k6pxRadius,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight,
          fontSize: fontSize.sp,
          height: 1,
        ),
      ),
    ),
  );
}

Widget forgotPasswordButton(BuildContext context) {
  return Container(
    height: 22.h,
    margin: EdgeInsets.only(top: 20.h),
    child: FlatButton(
      onPressed: () => {
        Navigator.pushNamed(
          context,
          '/forgot-password',
        )
      },
      child: Text(
        "Forgot password?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.secondaryElementText,
          fontFamily: "Avenir",
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          height: 1, // 设置下行高，否则字体下沉
        ),
      ),
    ),
  );
}

Widget thirdSocialButton({
  required String iconFileName,
  VoidCallback? onPressed,
  double width = 88,
  double height = 44,
}) {
  return SizedBox(
    width: width.w,
    height: height.h,
    child: FlatButton(
      onPressed: onPressed,
      shape: const RoundedRectangleBorder(
        side: Borders.primaryBorder,
        borderRadius: Radii.k6pxRadius,
      ),
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return SizedBox(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      color: gbColor,
      shape: const RoundedRectangleBorder(
        borderRadius: Radii.k6pxRadius,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: duSetFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}
