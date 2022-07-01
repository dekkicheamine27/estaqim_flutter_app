import 'package:estaqim_school/contracts/api_service.dart';
import 'package:estaqim_school/models/student.dart';
import 'package:estaqim_school/services/student_service.dart';
import 'package:get/get.dart';


class StudentController extends GetxController with StateMixin{
  
  final ApiStudentService studentService = StudentService();
  Student student = Student();


  @override
  void onInit() async {
    super.onInit();
     student = await studentService.getStudent();
    change(student,status: RxStatus.success());


  }
 




  

}