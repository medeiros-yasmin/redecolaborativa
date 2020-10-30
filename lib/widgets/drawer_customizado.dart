import 'package:flutter/material.dart';
import 'package:aplicacao_colaborativa/secao/secoes_drawer.dart';

class DrawerCustomizado extends StatelessWidget {
  final PageController pageController;

  DrawerCustomizado(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildPlanoDrawer() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.cyan, Colors.cyan[100]],
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
          )),
        );
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildPlanoDrawer(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "App \nColaborativo",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(children: <Widget>[
                        Text(
                          "Seja bem vindo,",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          child: Text(
                            "Faça login ou cadastr-se!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {},
                        )
                      ]),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerSecao(Icons.home, ("Inicio"), pageController, 0),
              DrawerSecao(Icons.list, ("Categorias"), pageController, 1),
              DrawerSecao(Icons.playlist_add_check_sharp,
                  ("Minhas publicações"), pageController, 2),
              DrawerSecao(Icons.save, ("Salvos"), pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
