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
    String token  = Dotenv.dotenv.env['TOKEN']!;
    http.Response response = await http.get(
      Uri.parse(studentUrl),
      headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjU2Njk4MzgwLCJpYXQiOjE2NTY2MTE5ODAsImp0aSI6IjhiYjUwNGFlM2MyZjQyOGFiYzlhZDdhOTY3OTMwN2I1IiwidXNlcl9pZCI6OX0.F9RahqBwxxKDfmMoZB4-gazm2bRu2mkoYW_tYAbaMLc',
    }
  
    );

    if (response.statusCode == 200) {
      Student student = Student.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      return student;
    } else {
      throw Exception('no data found');
      
    }
  }
  }