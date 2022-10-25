import 'package:flutter/material.dart';
import 'package:flutter_news/common/apis/api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/entities.dart';
import '../../common/utils/utils.dart';
import '../../common/values/values.dart';
import '../../common/widgets/widgets.dart';
import '../../global.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignInPageState();
  }
}

class _SignInPageState extends State<SignInPage> {
  // email的控制器
  final TextEditingController _emailController = TextEditingController();

  // 密码的控制器
  final TextEditingController _passController = TextEditingController();

  _handleNavSignUp() {
    Navigator.pushNamed(
      context,
      "/sign-up",
    );
  }

  void _handleSignIn() async {
    // if (!duIsEmail(_emailController.value.text)) {
    //   toastInfo(msg: '请正确输入邮件');
    //   return;
    // }
    // if (!duCheckStringLength(_passController.value.text, 6)) {
    //   toastInfo(msg: '密码不能小于6位');
    //   return;
    // }

    UserLoginRequestEntity params = UserLoginRequestEntity(
      email: _emailController.value.text,
      password: duSHA256(_passController.value.text),
    );

    UserLoginResponseEntity res = await UserApi.login(params: params);

    // toastInfo(msg: res.accessToken);

    Global.saveProfile(res);

    // List<NewsIndexResponseEntity> newsList = await NewsAPI.index();
    // print(newsList.length);

    Navigator.pushNamed(
      context,
      "/app-main",
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(top: 40.h + 44.h),
      child: Column(
        children: [
          iconLogo(),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputForm(BuildContext context) {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(top: 49.h),
      child: Column(
        children: [
          inputTextEdit(
            controller: _emailController,
            hintText: 'Email',
          ),
          inputTextEdit(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            marginTop: 15,
            hintText: 'Password',
            isPassword: true,
          ),
          _buildButtonRow(),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Container(
      height: 44.h,
      margin: EdgeInsets.only(top: 15.h),
      child: Row(
        children: [
          flatStyleButton(
              text: 'SignUp',
              onPressed: _handleNavSignUp,
              backgroundColor: AppColors.thirdElement,
              fontColor: AppColors.primaryElementText),
          const Spacer(),
          flatStyleButton(
            text: 'SignIn',
            onPressed: () {
              _handleSignIn();
            },
          ),
        ],
      ),
    );
  }

// 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: 295.w,
      margin: EdgeInsets.only(bottom: 40.h),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              children: <Widget>[
                thirdSocialButton(iconFileName: 'twitter'),
                const Spacer(),
                thirdSocialButton(iconFileName: 'google'),
                const Spacer(),
                thirdSocialButton(iconFileName: 'facebook'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      child: forgotPasswordButton(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        children: [
          _buildLogo(),
          _buildInputForm(context),
          const Spacer(),
          _buildThirdPartyLogin(),
          _buildSignUpButton(context),
        ],
      ),
    );
  }
}
