import 'package:flutter/material.dart';
import 'package:aplicacao_colaborativa/screens/home_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Menu Principal",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}
