import 'package:estaqim_school/models/book.dart';
import 'package:estaqim_school/models/course.dart';
import 'package:estaqim_school/models/level.dart';
import 'package:estaqim_school/models/student.dart';

abstract class ApiService {
  Future<List<Level>> getAll();
}

abstract class ApiBookService {
  Future<List<Book>> getAllBooks(int levelId);
}

abstract class ApiStudentService {
  Future<Student> getStudent();
  Future<Student> addCourse(int courseId);
}

abstract class ApiCoursesService {
  Future<List<Course>> getCourses(int bookId);
}
