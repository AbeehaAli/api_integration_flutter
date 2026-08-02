import 'dart:convert';

import 'package:flutter_api_integration/models/book_detail_model.dart';
import 'package:flutter_api_integration/models/book_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String Url =
      "https://openlibrary.org/search.json?q=flutter&limit=20";

  Future<List<BookModel>> fetchBooks() async {
    final response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return (data['docs'] as List).where((e) =>
         e['cover_i'] != null && e['cover_i'].toString().isNotEmpty)
      .map((e) => BookModel.fromJson(e as Map<String,dynamic>)).toList();
    } else {
      throw Exception("Failed to load books");
    }
  }

  Future<BookDetailModel> getBookDetail(String workKey) async{
    final response =await http.get(Uri.parse("https://openlibrary.org$workKey.json"),
  );
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    return BookDetailModel.fromJson(data);
  } else {
    throw Exception('Failed to load details');
  }
  }
}
