import 'package:estaqim_school/models/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_controller.dart';
import '../models/book.dart';

class CoursesList extends StatelessWidget {
  List<int> studentCourses = [];
  final List<Course> courses;

  CoursesList({required this.courses});


  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.put(StudentController());
    return Container(

      child: Center(
          child: controller.obx((state) => ListView.builder(
              itemCount: courses.length,
              itemBuilder: (BuildContext context, int position ){
                studentCourses.addAll(controller.student.course!);
                if (studentCourses.contains(courses[position].id)){
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:Colors.blue.shade900,
                        border: Border.all(color: Colors.white)
                    ),

                    margin: EdgeInsets.all(20),
                    child: MaterialButton(


                        padding: EdgeInsets.all(10),
                        height: 70,
                        child: Text(courses[position].title!, style: const TextStyle(color: Colors.white)),
                        onPressed: (){

                        }
                    ),
                  );
                }else{
                  return Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey,
                        border: Border.all(color: Colors.white)
                    ),
                    child: MaterialButton(

                        padding: EdgeInsets.all(20),
                        height: 70,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.lock_rounded, color: Colors.white),
                              SizedBox(width: 10,),
                              Text(courses[position].title!, style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              )),



                            ] ),
                        onPressed: (){
                          Get.defaultDialog(title: "هذا الدرس مغلق", middleText: 'عليك سماع الدرس السابق واجتياز الإختبار الخاص به');
                        }
                    ),
                  );
                }
              }

          ),
          )
      ),
    );
  }
}
