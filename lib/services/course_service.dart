import 'dart:convert';

import 'package:estaqim_school/contracts/api_service.dart';
import 'package:estaqim_school/models/book.dart';
import 'package:estaqim_school/models/course.dart';
import 'package:estaqim_school/models/level.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as Dotenv;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CourseService implements ApiCoursesService {
  @override
  Future<List<Course>> getCourses(int bookId) async {
    await Dotenv.dotenv.load();
    String booksUrl = Dotenv.dotenv.env['COURSES']!;
    http.Response response = await http.get(
      Uri.parse(booksUrl + bookId.toString()),
    );

    if (response.statusCode == 200) {
      List<Course> courses = [];
      for (var course in jsonDecode(utf8.decode(response.bodyBytes))) {
        courses.add(Course.fromJson(course));
      }
      return courses;
    } else {
      throw Exception('no data found');
    }
  }
}
