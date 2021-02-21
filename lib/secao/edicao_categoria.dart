import 'package:aplicacao_colaborativa/screens/tela_edicao_publicacao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EdicaoCategoria extends StatelessWidget {
  final DocumentSnapshot categoria;

  EdicaoCategoria(this.categoria);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Card(
        child: ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(categoria.data["icone"]),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            categoria.data["titulo"],
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w800),
          ),
          children: <Widget>[
            FutureBuilder<QuerySnapshot>(
              future: categoria.reference.collection("itens").getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Container();
                return Column(
                  children: snapshot.data.documents.map((doc) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(doc.data["imagens"][0]),
                      ),
                      title: Text(doc.data["titulo"]),
                      trailing: Text(doc.data["autor"]),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TelaEdicaoPublicacao(
                                  idCategoria: categoria.documentID,
                                  publicacao: doc,
                                )));
                      },
                    );
                  }).toList()
                    ..add(ListTile(
                      tileColor: Colors.purple,
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.add,
                          color: Colors.cyan,
                        ),
                      ),
                      title: Text(
                        "Adicionar",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TelaEdicaoPublicacao(
                                  idCategoria: categoria.documentID,
                                )));
                      },
                    )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
