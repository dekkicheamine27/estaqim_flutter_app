import 'package:estaqim_school/controllers/levels_controller.dart';
import 'package:estaqim_school/views/profile.dart';
import 'package:estaqim_school/widgets/level_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/student_biding.dart';

class LevelsPage extends GetView<LevelController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('كل المستويات')),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,

      ),
      body: controller.obx((state) => LevelsList(controller.levels)),

    );
  }
}
