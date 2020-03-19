import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:chuck_norris/pages/jokepage.dart';
import 'package:chuck_norris/services/chucknorris.dart' as chucknorris;

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List categories = List();
  var isLoading = false;

  @override
  initState() {
    super.initState();
    _getCategories();
  }

 _getCategories() async {
    try {
      setState(() => isLoading = true);
      categories = await chucknorris.getCategories(http.Client());
    } catch (_) {
      throw Exception('Failed to load joke categories');
    } finally {
      setState(() => isLoading = false);
    }
  }

  _buildCategory(index) {
    final title = categories[index];
    final category = categories[index];

    return ListTile(
      title: Text(
        category,
        key: Key('item_${index}_text')
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JokePage( title: title, category: category),
          )
        );
      }
    );
  }

  _buildCategories() {
    return ListView.builder(
      key: Key('list'),
      padding: EdgeInsets.all(8),
      itemCount: categories.length,
      itemBuilder: (context, index) => _buildCategory(index)
    );
  }


  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: isLoading ? Center(child: CircularProgressIndicator()) : _buildCategories()
    );
  }
}
