import 'dart:math';

import 'package:assignment/app/data/dtos/blog_dtos.dart';
import 'package:assignment/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/widgets/theme.dart';

class CreateBlogPage extends StatefulWidget {
  const CreateBlogPage({super.key});

  @override
  State<CreateBlogPage> createState() => _CreateBlogPageState();
}

class _CreateBlogPageState extends State<CreateBlogPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: darkBlueColor,
              size: 30,
            )),
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Let's Create",
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Create new blog",
                          style: regularTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 37),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Blog Title",
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Blog Description",
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: descController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            isDense: true,
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      var task = BlogModel(
                          id: Random.secure().nextInt(10000).toString(),
                          title: titleController.text,
                          description: descController.text,
                          createdAt: DateFormat('dd/MM/yyyy hh:mm:ss')
                              .format(DateTime.now()));
                      await controller.createBlog(task).then((value) {
                        if (value) {
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Blog not added!")));
                        }
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Post',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
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
