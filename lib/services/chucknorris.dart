import 'dart:convert';
import 'package:http/http.dart';

import 'package:chuck_norris/models/joke.dart';

Future getCategories(Client client) async {
  try {
    final response = await client.get('https://api.chucknorris.io/jokes/categories');
    return (json.decode(response.body) as List);
  } catch (error) {
    rethrow;
  }
}

Future getRandonJoke(Client client, String category) async {
  try {
    final response = await client.get('https://api.chucknorris.io/jokes/random?category=${category}');
    return Joke.fromJson(json.decode(response.body));
  } catch (error) {
    rethrow;
  }
}