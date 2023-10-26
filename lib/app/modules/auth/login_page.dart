import 'package:assignment/app/core/widgets/theme.dart';
import 'package:assignment/app/data/dtos/raw_data.dart';
import 'package:assignment/app/routes/home_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/app_text_form_field.dart';
import '../../core/widgets/button.dart';
import '../../routes/auth_routes.dart';
import 'auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            width: width,
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                    scale: 0.6, child: const FlutterLogo(size: 100)),
                Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: blueColor),
                ),
                const SizedBox(height: 40),
                AppTextFormFeilds(
                    hintText: 'Enter Your Email',
                    isFilled: true,
                    fillColor: darkGrey,
                    feildIcon: Icons.email_outlined,
                    isPasswordFeild: false,
                    controller: emailController),
                const SizedBox(height: 20),
                AppTextFormFeilds(
                  isFilled: true,
                  fillColor: darkGrey,
                  hintText: 'Enter Your Password',
                  feildIcon: Icons.lock_open_rounded,
                  isPasswordFeild: controller.showPassWord.value,
                  controller: passwordController,
                ),
                const SizedBox(height: 30),
                AppButton(
                  onTap: () async {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      RawData rawData = await controller.loginWithEmail(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      if (rawData.operationResult == OperationResult.success) {
                        Get.offAllNamed(HomeRoutes.home);
                      } else {
                        Get.showSnackbar(GetSnackBar(
                          message: "${rawData.data}",
                          duration: const Duration(seconds: 2),
                        ));
                      }
                    } else {
                      Get.showSnackbar(const GetSnackBar(
                        message: "Provide Credentials",
                        duration: Duration(seconds: 2),
                      ));
                    }
                  },
                  buttonColor: blueColor,
                  hintText: 'Login',
                  width: width,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(AuthRoutes.signup);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have account? ',
                      style: TextStyle(color: gray),
                      children: [
                        TextSpan(
                            text: 'SignUp', style: TextStyle(color: blueColor))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
