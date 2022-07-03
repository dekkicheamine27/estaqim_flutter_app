import 'dart:convert';
import 'package:estaqim_school/contracts/api_service.dart';
import 'package:estaqim_school/models/book.dart';
import 'package:estaqim_school/models/student.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as Dotenv;
import 'package:http/http.dart' as http;

class StudentService implements ApiStudentService {
  @override
  Future<Student> getStudent() async {
    await Dotenv.dotenv.load();
    String studentUrl = Dotenv.dotenv.env['STUDENT']!;
    String token = Dotenv.dotenv.env['TOKEN']!;
    http.Response response = await http.get(Uri.parse(studentUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU3MzA2NDEwLCJpYXQiOjE2NTY3MDE2MTAsImp0aSI6IjQ0Y2IxNzIyOGNhZjRiMzM4MWE2N2Q4YTA3OWE1M2RlIiwidXNlcl9pZCI6OX0.wfhnJ2JG3GTd74OJI3OFiTIIc3UUd8G7uaW6UoMMyCE',
    });

    if (response.statusCode == 200) {
      Student student =
          Student.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      return student;
    } else {
      throw Exception('no data found');
    }
  }

  @override
  Future<Student> addCourse(int courseId) async {

    await Dotenv.dotenv.load();
    String studentUrl = Dotenv.dotenv.env['STUDENT']!;
    String token = Dotenv.dotenv.env['TOKEN']!;
    http.Response response = await http.put(
        Uri.parse(studentUrl),
        body: jsonEncode({"course": [courseId]}),
        headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
      'JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU3MzA2NDEwLCJpYXQiOjE2NTY3MDE2MTAsImp0aSI6IjQ0Y2IxNzIyOGNhZjRiMzM4MWE2N2Q4YTA3OWE1M2RlIiwidXNlcl9pZCI6OX0.wfhnJ2JG3GTd74OJI3OFiTIIc3UUd8G7uaW6UoMMyCE',
    });

    if (response.statusCode == 200) {
      Student student =
      Student.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      return student;
    } else {
      throw Exception('no data found');
    }

  }
}
