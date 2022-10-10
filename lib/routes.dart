import 'package:flutter_news/pages/forgot_password/forgot_password.dart';
import 'package:flutter_news/pages/sign_in/sign_in.dart';
import 'package:flutter_news/pages/sign_up/sign_up.dart';

var staticRoutes = {
  "/sign-in": (context) => const SignInPage(),
  "/sign-up": (context) => const SignUpPage(),
  "/forgot-password": (context) => const ForgotPasswordPage(),
};
