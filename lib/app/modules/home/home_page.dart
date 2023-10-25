import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/home_routes.dart';
import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
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
                      return ListTile(
                        title: Text(
                          '${controller.blogList[index].title}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        subtitle: Text(
                          '${controller.blogList[index].description}',
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                        ),
                        trailing: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.edit)),
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
