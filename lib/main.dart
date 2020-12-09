import 'package:flutter/material.dart';
import 'package:news_app/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text('MaNews'),
          backgroundColor: Colors.black12,
        ),
        body: BodyScreen(),
        backgroundColor: Colors.black38,
      ),
    );
  }
}
