import 'package:aplicacao_colaborativa/secao/edicao_publicacoes.dart';
import 'package:flutter/material.dart';
import 'package:aplicacao_colaborativa/tabs/home_tab.dart';
import 'package:aplicacao_colaborativa/widgets/drawer_customizado.dart';
import 'package:aplicacao_colaborativa/tabs/tab_categorias.dart';

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
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias"),
            centerTitle: true,
          ),
          drawer: DrawerCustomizado(_pageController),
          body: TabCategorias(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Editar/Criar Publicações"),
            centerTitle: true,
          ),
          drawer: DrawerCustomizado(_pageController),
          body: EdicaoPublicacao(),
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
