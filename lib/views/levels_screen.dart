import 'package:estaqim_school/controllers/levels_controller.dart';
import 'package:estaqim_school/widgets/level_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LevelsPage extends GetView<LevelController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('All Levels')),
      ),
      body: controller.obx((state) => LevelsList(controller.levels)),
    );
  }
}
