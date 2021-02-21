import 'package:aplicacao_colaborativa/dados/dado_leitura.dart';
import 'package:flutter/material.dart';
import 'package:aplicacao_colaborativa/screens/tela_publicacao.dart';

class SecaoProduto extends StatelessWidget {
  final String tipo;
  final DadoProduto publicacao;

  SecaoProduto(this.tipo, this.publicacao);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TelaPublicacao(publicacao)));
      },
      child: Card(
        child: tipo == "grid"
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.network(
                        publicacao.imagens[0],
                        fit: BoxFit.cover,
                      )),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(publicacao.titulo,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            )),
                        Text(
                          publicacao.autor,
                          style: TextStyle(
                              color: Colors.purple,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ))
                ],
              )
            : Row(
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Image.network(
                        publicacao.imagens[0],
                        fit: BoxFit.cover,
                        height: 150,
                      )),
                  Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              publicacao.titulo,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              publicacao.autor,
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ))
                ],
              ),
      ),
    );
  }
}
