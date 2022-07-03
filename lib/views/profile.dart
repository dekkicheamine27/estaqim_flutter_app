import 'package:estaqim_school/controllers/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends GetView<StudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Column(
        children: [
          Text(controller.student.firstName.toString()),
          Text(controller.student.lastName.toString()),
        ],
      ),
    ));
  }
}
