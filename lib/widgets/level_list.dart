import 'package:estaqim_school/bindings/books_binding.dart';
import 'package:estaqim_school/bindings/student_biding.dart';
import 'package:estaqim_school/controllers/student_controller.dart';
import 'package:estaqim_school/views/books_level.dart';
import 'package:estaqim_school/views/profile.dart';
import 'package:flutter/material.dart';
import '../models/level.dart';
import 'package:get/get.dart';

class LevelsList extends StatelessWidget {
  List<int> studentLevels = [];
  List<Level> levels;

  LevelsList(this.levels);



  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.put(StudentController());

    return Container(

      child: Center(
        child: controller.obx((state) => ListView.builder(
            itemCount: levels.length,
            itemBuilder: (BuildContext context, int position ){
              studentLevels.addAll(controller.student.level!);
              if (studentLevels.contains(levels[position].id)){
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
                    child: Text(levels[position].name!, style: const TextStyle(color: Colors.white)),
                    onPressed: (){
                       Get.to(()=>BooksLevelPage(levelId: levels[position].id!, levelName: levels[position].name!), binding: BooksBinding());
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
                            Text(levels[position].name!, style: const TextStyle(
                                color: Colors.white,
                                 fontSize: 20
                            )),



                        ] ),
                      onPressed: (){
                          Get.defaultDialog(title: "هذا المستوى مغلق", middleText: 'عليك اجتياز اختبار المستوى السابق');
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
