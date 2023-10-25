import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
