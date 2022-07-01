import 'package:estaqim_school/controllers/books_controller.dart';
import 'package:estaqim_school/widgets/books_level_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class BooksLevelPage extends GetView<BooksController> {
  int levelId;
  String levelName;

  BooksLevelPage({required this.levelId, required this.levelName});



  @override
  Widget build(BuildContext context) {
    controller.getBooks(levelId);

    return Scaffold(
      appBar: AppBar(
        title: Text(levelName),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,

      ),
      body: controller.obx((state) => BooksList(books: controller.books,))
    );
  }
}
