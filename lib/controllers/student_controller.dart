import 'package:estaqim_school/contracts/api_service.dart';
import 'package:estaqim_school/models/student.dart';
import 'package:estaqim_school/services/level_service.dart';
import 'package:estaqim_school/services/student_service.dart';
import 'package:get/get.dart';
import '../models/level.dart';

class StudentController extends GetxController with StateMixin{
  
  final ApiStudentService studentService = StudentService();
  Student student = Student();

  @override
  void onInit() {
    super.onInit();
    studentService.getstudent().then((value) => student = value );
    change(student, status: RxStatus.success());

  }
 




  

}