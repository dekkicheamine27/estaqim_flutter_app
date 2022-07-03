import 'package:estaqim_school/controllers/course_controller.dart';

import 'package:estaqim_school/widgets/courses_list.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/student_biding.dart';

class CoursesPage extends GetView<CourseController> {
  int bookId;
  String bookName;

  CoursesPage({required this.bookId, required this.bookName,});

  @override
  Widget build(BuildContext context) {
    controller.getCourses(bookId);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(' دروس  $bookName' )),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: controller.obx((state) => CoursesList(
            courses: controller.courses,

          )),
    );
  }
}
