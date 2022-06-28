import 'package:estaqim_school/controllers/levels_controller.dart';
import 'package:get/get.dart';

class LevelBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(LevelController());
  }

}