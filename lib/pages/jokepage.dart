import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chuck_norris/extensions/string.dart';
import 'package:chuck_norris/models/joke.dart';

import 'package:chuck_norris/services/chucknorris.dart' as chucknorris;
class JokePage extends StatefulWidget {
  JokePage({Key key, this.title, this.category}) : super(key: key);

  final String title;
  final String category;

  @override
  createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  Joke joke;
  var isLoading = false;

  @override
  initState() {
    super.initState();
    _getRandonJoke();
  }

  _getRandonJoke() async {
    try {
      setState(() => isLoading = true);
      joke = await chucknorris.getRandonJoke(http.Client(), widget.category);
    } catch (_) {
      throw Exception('Failed to load joke categories');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  build(BuildContext context) {
    final title = widget.title.capitalize();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: joke != null ? Text(joke.value) : CircularProgressIndicator())
    );
  }
}
