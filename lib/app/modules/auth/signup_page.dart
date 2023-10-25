import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class SignupPage extends GetView<AuthController> {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Signup Page is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
