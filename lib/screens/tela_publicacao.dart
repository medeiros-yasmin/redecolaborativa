import 'package:aplicacao_colaborativa/dados/dado_leitura.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:aplicacao_colaborativa/dados/dado_leitura.dart';

class TelaPublicacao extends StatefulWidget {
  final DadoProduto publicacao;

  TelaPublicacao(this.publicacao);
  @override
  _TelaPublicacaoState createState() => _TelaPublicacaoState(publicacao);
}

class _TelaPublicacaoState extends State<TelaPublicacao> {
  final DadoProduto publicacao;

  _TelaPublicacaoState(this.publicacao);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(publicacao.titulo),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 0.9,
            child: Carousel(
              images:
                  publicacao.imagens.map((url) => NetworkImage(url)).toList(),
              dotSize: 6.0,
              dotSpacing: 20.0,
              dotBgColor: Colors.transparent,
              dotColor: Colors.cyan,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  publicacao.titulo,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.cyan,
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 10.0),
                Text(
                  publicacao.descricao,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                ),
                SizedBox(height: 15.0),
                Text(
                  "Registre sua impressão",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 15.0),
                Icon(Icons.favorite),
                SizedBox(height: 15.0),
                SizedBox(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Adicionar aos favoritos",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.purple,
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
