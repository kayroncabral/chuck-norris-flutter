import 'package:flutter/material.dart';

import 'package:chuck_norris/pages/jokepage.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _categories = <String>['animal', 'career', 'celebrity', 'dev', 'explicit', 'fashion', 'food', 'history', 'money', 'movie', 'music', 'political', 'religion', 'science', 'sport', 'travel'];

  @override
  initState() {
    super.initState();
  }

  // _onCategoryTapped(int index) {
  //   setState(() {
      
  //   });
  // }

  _buildCategory(String category) {
    return ListTile(
      title: Text(category),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => JokePage()));
      }
    );
  }

  _buildCategories() {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        if (index.isOdd) return Divider();

        return _buildCategory('Category');
      },
    );
  }


  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _buildCategories()
    );
  }
}
