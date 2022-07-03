import 'package:estaqim_school/controllers/student_controller.dart';
import 'package:get/get.dart';

class StudentBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StudentController());
  }
}
