import 'dart:convert';
import 'package:http/http.dart' as http;

Future getCategories() async {
  try {
    final response = await http.get('https://api.chucknorris.io/jokes/categories');
    return (json.decode(response.body) as List);
  } catch (error) {
    rethrow;
  }
}

Future getRandonJoke(category) async {
  try {
    final response = await http.get('https://api.chucknorris.io/jokes/random?category=${category}');
    return json.decode(response.body);
  } catch (error) {
    rethrow;
  }
}