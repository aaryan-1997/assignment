import 'package:assignment/app/modules/auth/signup_page.dart';
import 'package:get/get.dart';

import '../modules/auth/auth_binding.dart';
import '../modules/auth/login_page.dart';

class AuthRoutes {
  AuthRoutes._();

  static const login = '/login';
  static const signup = '/signup';

  static final routes = [
    GetPage(
      name: login,
      page: () =>  LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: signup,
      page: () =>  SignupPage(),
      binding: AuthBinding(),
    ),
  ];
}
