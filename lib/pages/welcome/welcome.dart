import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/values/values.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _buildBody() {
    return Center(
      child: Column(
        children: [
          _buildHeaderTitle(),
          _buildHeaderDetails(),
          _buildFeatureItem(
            "feature-1",
            "Compelling photography and typography provide a beautiful reading",
            86.h,
          ),
          _buildFeatureItem(
            "feature-2",
            "Sector news never shares your personal data with advertisers or publishers",
            20.h,
          ),
          _buildFeatureItem(
            "feature-3",
            "You can get Premium to unlock hundreds of publications",
            20.h,
          ),
          const Spacer(),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Container(
      width: 295.w,
      height: 44.h,
      margin: EdgeInsets.only(bottom: 20.h),
      child: FlatButton(
        color: AppColors.primaryElement,
        textColor: AppColors.primaryElementText,
        child: const Text("Get started"),
        shape: const RoundedRectangleBorder(
          borderRadius: Radii.k6pxRadius,
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildFeatureItem(String imageName, String intro, double marginTop) {
    return Container(
      width: 295.w,
      height: 80.h,
      margin: EdgeInsets.only(top: marginTop),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            height: 80.w,
            child: Image.asset(
              'assets/images/$imageName.png',
              fit: BoxFit.none,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 195.w,
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 16.sp,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 60.h + 44.h),
      child: Text(
        'Features',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 24.sp,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          height: 1,
        ),
      ),
    );
  }

  Widget _buildHeaderDetails() {
    return Container(
      width: 242.w,
      height: 70.h,
      margin: EdgeInsets.only(top: 14.h),
      child: Text(
        'The best of news channels all in one place. Trusted sources and personalized news for you.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
          height: 1.3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }
}
