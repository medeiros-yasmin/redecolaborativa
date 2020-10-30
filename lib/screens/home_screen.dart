import 'package:flutter/material.dart';
import 'package:aplicacao_colaborativa/tabs/home_tab.dart';
import 'package:aplicacao_colaborativa/widgets/drawer_customizado.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: DrawerCustomizado(_pageController),
        ),
        Container(
          color: Colors.purple,
        ),
        Container(
          color: Colors.pink,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}
