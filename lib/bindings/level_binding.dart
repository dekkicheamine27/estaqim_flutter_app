import 'package:estaqim_school/bindings/student_biding.dart';
import 'package:estaqim_school/controllers/levels_controller.dart';
import 'package:get/get.dart';

class LevelBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LevelController());
    Get.put(StudentBinding());
  }
}
