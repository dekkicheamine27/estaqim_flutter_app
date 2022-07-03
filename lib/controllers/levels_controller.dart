import 'package:estaqim_school/contracts/api_service.dart';
import 'package:estaqim_school/services/level_service.dart';
import 'package:get/get.dart';
import '../models/level.dart';

class LevelController extends GetxController with StateMixin {
  final ApiService levelService = LevelService();
  RxList<Level> levels = RxList<Level>();

  @override
  void onInit() {
    super.onInit();
    levelService.getAll().then((resultLevels) {
      levels.addAll(resultLevels);
      change(levels, status: RxStatus.success());
    });
  }
}
