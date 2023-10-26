import 'package:assignment/app/modules/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/auth_routes.dart';
import '../../routes/home_routes.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Expanded(
              child: Text('Blogs'),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.getBlogData();
          },
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    itemCount: controller.blogList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8),
                          title: Text(
                            '${controller.blogList[index].title}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.blogList[index].description}',
                                style: const TextStyle(fontSize: 14),
                                maxLines: 2,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${controller.blogList[index].createdAt}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(HomeRoutes.createBlog);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LogoutButton extends GetView<AuthController> {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () async {
          await controller.logOut();
          Get.offAllNamed(AuthRoutes.login);
        },
        child: const Icon(Icons.exit_to_app),
      );
    });
  }
}
