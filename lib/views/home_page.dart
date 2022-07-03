import 'package:estaqim_school/bindings/level_binding.dart';
import 'package:estaqim_school/controllers/student_controller.dart';
import 'package:estaqim_school/views/levels_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/student_biding.dart';

class HomePage extends GetView<StudentController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مدرسة فاستقم كما أمرت'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: controller.obx(
        (state) => Center(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(30),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(

                    border: Border.all(
                        width: 3, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(75),
                  ),
                  child: FaIcon(FontAwesomeIcons.user,
                      size: 70, color: Theme.of(context).primaryColor)),
              Text(
                controller.student.firstName!.toString() +
                    " " +
                    controller.student.lastName.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    "مجموع النقاط:  " + controller.student.score!.toString(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                child: MaterialButton(
                    child: Text(
                      "دراستي",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Get.to(()=>LevelsPage(), binding: LevelBinding());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
