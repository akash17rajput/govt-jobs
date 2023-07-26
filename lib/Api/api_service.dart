import 'dart:convert';
import 'package:http/http.dart' as http;

import 'modelClass.dart';

class ApiService {
  static Future<List<Post>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://drive.google.com/uc?export=download&id=1VFkKLE8Pu2dwrSB3Ltx0PgPjPxFO2Ps2'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final vacancies = data['vacancies']; // Access the 'vacancies' key
      final posts = vacancies.map<Post>((json) => Post.fromJson(json)).toList();
      return posts;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
