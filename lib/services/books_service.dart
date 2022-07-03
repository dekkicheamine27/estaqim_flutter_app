import 'dart:convert';

import 'package:estaqim_school/contracts/api_service.dart';
import 'package:estaqim_school/models/book.dart';
import 'package:estaqim_school/models/level.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as Dotenv;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BooksService implements ApiBookService {
  @override
  Future<List<Book>> getAllBooks(int levelId) async {
    await Dotenv.dotenv.load();
    String levelsUrl = Dotenv.dotenv.env['BOOKS']!;
    http.Response response = await http.get(
      Uri.parse(levelsUrl + levelId.toString()),
    );

    if (response.statusCode == 200) {
      List<Book> books = [];
      for (var book in jsonDecode(utf8.decode(response.bodyBytes))) {
        books.add(Book.fromJson(book));
      }
      return books;
    } else {
      throw Exception('no data found');
    }
  }
}
