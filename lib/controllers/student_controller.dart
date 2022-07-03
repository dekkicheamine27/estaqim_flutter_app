import 'package:estaqim_school/contracts/api_service.dart';
import 'package:estaqim_school/models/student.dart';
import 'package:estaqim_school/services/student_service.dart';
import 'package:get/get.dart';

import '../models/course.dart';

class StudentController extends GetxController with StateMixin {
  final ApiStudentService studentService = StudentService();
  Student student = Student();
  List<int> courses = <int>[].obs;

  @override
  void onInit() async {
    super.onInit();
    student = await studentService.getStudent();
    courses = student.course!;
    change(student, status: RxStatus.success());

  }


  addCourse(int courseId) async{
    student = await studentService.addCourse(courseId);
  }

  getStudent() async {
    student = await studentService.getStudent();
    courses = student.course!;
    change(student, status: RxStatus.success());

  }

  @override
  void onReady() async {
    super.onReady();

    student = await studentService.getStudent();
    courses = student.course!;
  }

}
