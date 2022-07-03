import 'package:estaqim_school/bindings/books_binding.dart';
import 'package:estaqim_school/controllers/course_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:estaqim_school/controllers/student_controller.dart';
import 'package:estaqim_school/views/books_level.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/level.dart';
import 'package:get/get.dart';
import 'package:estaqim_school/controllers/course_controller.dart';
class LevelsList extends GetView<StudentController> {
  List<int> studentLevels = [];
  List<Level> levels;

  LevelsList(this.levels);

  @override
  Widget build(BuildContext context) {
    Get.put(StudentController());



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
            itemCount: levels.length,
            itemBuilder: (BuildContext context, int position) {
              studentLevels.addAll(controller.student.level!);
              //level button active
              if (studentLevels.contains(levels[position].id)) {
                return Container(

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Colors.white)),
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(

                      height: MediaQuery.of(context).size.height / 11,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(FontAwesomeIcons.circleCheck, color: Color(0xff06d6a0),),

                          Text(levels[position].name!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Get.context!.height / 42,
                                  fontFamily: 'Cairo'
                              ),),

                        ],
                      ),
                      onPressed: () async {


                        Get.to(

                            () => BooksLevelPage(
                                nbStudentCourses: controller.student.level!.length,
                                levelId: levels[position].id!,
                                nextLevelId: levels[position + 1].id!,
                                levelName: levels[position].name!),
                            binding: BooksBinding());
                      }),
                );
              } else {
                //level button disables
                return Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blueGrey,
                      border: Border.all(color: Colors.white)),
                  child: MaterialButton(


                      height: MediaQuery.of(context).size.height / 11,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.lock_rounded, color: Colors.white),

                            AutoSizeText(levels[position].name!,
                                style: TextStyle(color: Colors.white, fontSize: Get.context!.height /42),
                               maxLines: 2,

                            ),


                          ]),
                      onPressed: () {
                        Get.defaultDialog(
                            title: "هذا المستوى مغلق",
                            middleText: 'عليك اجتياز اختبار المستوى السابق');
                      }),
                );
              }
            }),
      )),
    );
  }
}
