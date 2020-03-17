import 'package:flutter/material.dart';

import 'package:chuck_norris/pages/categoriespage.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CategoriesPage(title: 'Chuck Norris'),
    );
  }
}