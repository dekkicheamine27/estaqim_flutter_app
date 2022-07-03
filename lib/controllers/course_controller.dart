import 'package:estaqim_school/models/course.dart';
import 'package:estaqim_school/services/course_service.dart';
import 'package:get/get.dart';

class CourseController extends GetxController with StateMixin {
  CourseService courseService = CourseService();
  RxList<Course> courses = RxList<Course>();

  getCourses(int id) {
    if( courses.isEmpty ) {
      courseService.getCourses(id).then((resultCourses) {
        courses.addAll(resultCourses);
        change(courses, status: RxStatus.success());
      });

    }
    update();
  }

}
