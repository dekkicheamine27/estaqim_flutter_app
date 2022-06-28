import 'package:estaqim_school/bindings/level_binding.dart';
import 'package:estaqim_school/views/home_page.dart';
import 'package:estaqim_school/views/levels_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/levels", page: () => LevelsPage(),),
      ],
      home: LevelsPage(),
      initialBinding: LevelBinding(),
    );
  }
}

