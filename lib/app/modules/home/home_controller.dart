import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../data/dtos/blog_dtos.dart';

class HomeController extends GetxController {
  RxList<BlogModel> blogList = <BlogModel>[].obs;
  @override
  void onInit() {
    getBlogData();
    super.onInit();
  }

  Future<void> getBlogData() async {
    blogList.value = [];
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection("blog");
    try {
      QuerySnapshot querySnapshot = await collectionRef.get();
      for (var document in querySnapshot.docs) {
        if (document.exists) {
          var result = document.data() as Map<String, dynamic>;
          var data = BlogModel.fromJson({
            'id': document.id,
            'title': result['title'],
            'description': result['description'],
            'created_at': result['created_at'],
          });
          blogList.add(data);
        }
      }
    } catch (e) {
      log("$e");
    }
  }

  Future<void> updateBlog(id) async {
    await FirebaseFirestore.instance.collection("blog").doc(id).delete();
  }

  Future<bool> createBlog(BlogModel task) async {
    try {
      await FirebaseFirestore.instance
          .collection("blog")
          .doc()
          .set(task.toJson());
      getBlogData();
      return true;
    } catch (e) {
      log("_error_create_blog=>$e");
      return false;
    }
  }
}
