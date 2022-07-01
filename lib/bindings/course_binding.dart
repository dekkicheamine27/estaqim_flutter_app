
import 'package:estaqim_school/bindings/student_biding.dart';
import 'package:estaqim_school/controllers/course_controller.dart';
import 'package:get/get.dart';

class CourseBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CourseController());
    Get.put(StudentBinding());
  }

}