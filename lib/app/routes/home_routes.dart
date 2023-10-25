import 'package:assignment/app/modules/home/create_blog_page.dart';
import 'package:get/get.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/splash_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static const splash = '/splash';
  static const home = '/home';
  static const createBlog = '/createBlog';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: createBlog,
      page: () => const CreateBlogPage(),
      binding: HomeBinding(),
    ),
  ];
}
