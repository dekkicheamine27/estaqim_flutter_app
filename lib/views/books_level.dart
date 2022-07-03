import 'package:estaqim_school/controllers/books_controller.dart';
import 'package:estaqim_school/controllers/course_controller.dart';
import 'package:estaqim_school/widgets/books_level_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BooksLevelPage extends GetView<BooksController> {
  final int levelId;
  final int nextLevelId;
  final String levelName;
  int nbStudentCourses;
  double percentage = 0.0;

  BooksLevelPage({
    required this.nextLevelId,
    required this.levelId,
    required this.levelName,
    required this.nbStudentCourses,
  });

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
      body: controller.obx((state) => Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: CircularPercentIndicator(
                  animation: true,
                  radius: 60.0,
                  lineWidth: 6.0,
                  percent: 0.5,
                  center: Text("50%"
                      ""),
                  progressColor: Color(0xff28666e),
                ),
              ),
              Text(
                'نسبة التقدم في المستوى',
                style: TextStyle(fontSize: 10, color: Color(0xff28666e)),
              ),
              BooksList(
                books: controller.books,
              ),
            ],
          )),
      bottomSheet: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
        height: 48,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: MaterialButton(
            child: Text(
              "إمتحان  " + levelName + " الشامل",
              style: TextStyle(
                  color: Color(0xfffedc97), fontWeight: FontWeight.bold),
            ),
            onPressed: () {}),
      ),
    );
  }
}
