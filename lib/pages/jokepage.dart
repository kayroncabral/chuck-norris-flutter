import 'package:flutter/material.dart';

class JokePage extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Detail'),
      ),
      body: Center(child: RaisedButton(onPressed: () {}, child: Text('Go back'),),)
    );
  }
}
