import 'package:assignment/app/core/helpers/prefs.dart';
import 'package:assignment/app/routes/auth_routes.dart';
import 'package:assignment/app/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      if (await PrefRepository().getToken() == null ||
          await PrefRepository().getToken() == "") {
        Get.offAllNamed(AuthRoutes.login);
      } else {
        Get.offAllNamed(HomeRoutes.home);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
