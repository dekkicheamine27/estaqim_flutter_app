import 'dart:convert';

import 'package:estaqim_school/models/level.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as Dotenv;
import 'package:http/http.dart' as http;
class LevelService {
  Future<List<Level>> getLevels() async {
    await Dotenv.dotenv.load();
    String levelsUrl = Dotenv.dotenv.env['LEVELS']!;
    http.Response response = await http.get(
      Uri.parse(levelsUrl),
    );

    if (response.statusCode == 200) {
      List<Level> levels = [];
      for (var level in jsonDecode(utf8.decode(response.bodyBytes))) {
        levels.add(Level.fromJson(level));
      }
      return levels;
    } else {
      throw Exception('no data found');
    }
  }
}