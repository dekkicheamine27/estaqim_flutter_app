import 'package:estaqim_school/bindings/course_binding.dart';
import 'package:estaqim_school/models/course.dart';
import 'package:estaqim_school/views/single_course_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_controller.dart';

class CoursesList extends GetView<StudentController> {
  List<int> studentCourses = [];
  final List<Course> courses;


  CoursesList({required this.courses,});

  @override
  Widget build(BuildContext context) {
    controller.getStudent();
    return Container(
      margin: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 40),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white60,
          border: Border.all(color: Theme.of(context).primaryColor, width: 5 )

      ),
      child: Center(
          child: controller.obx(
        (state) => ListView.builder(
            itemCount: courses.length,
            itemBuilder: (BuildContext context, int position) {
              studentCourses.addAll(controller.courses);
              if (studentCourses.contains(courses[position].id) |
                      courses[position].isFirst! ==
                  true) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Colors.white)),
                  margin: EdgeInsets.all(5),
                  child: MaterialButton(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.play_circle_outline_rounded,
                              color: Colors.white),
                          SizedBox(
                            width: 20,
                          ),
                          Text(courses[position].title!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)),
                        ],
                      ),
                      onPressed: () {
                        Get.to(
                            () => SingleCoursePage(
                                  nextCourseId: courses[position + 1 ].id!,
                                  courseId: courses[position].id!,
                                  courseName: courses[position].title!,
                                  courseUrl: courses[position].url!,
                                  quizzes: courses[position].quizzes!,
                                ),
                            binding: CourseBinding());
                      }),
                );
              } else {
                return Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey,
                      border: Border.all(color: Colors.white)),
                  child: MaterialButton(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.lock_rounded, color: Colors.white),
                            SizedBox(
                              width: 20,
                            ),
                            Text(courses[position].title!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ]),
                      onPressed: () {
                        Get.defaultDialog(
                            title: "?????? ?????????? ????????",
                            middleText:
                                '???????? ???????? ?????????? ???????????? ?????????????? ???????????????? ?????????? ???? ?????????? ?????? ??????????');
                      }),
                );
              }
            }),
      )),
    );
  }
}
