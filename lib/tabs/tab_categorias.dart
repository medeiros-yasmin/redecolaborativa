import 'package:aplicacao_colaborativa/secao/secao_categorias.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TabCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("categorias").getDocuments(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var divisoriaTiles = ListTile.divideTiles(
                    tiles: snapshot.data.documents.map((doc) {
                      return SecaoCategoria(doc);
                    }).toList(),
                    color: Colors.cyan[800])
                .toList();
            return ListView(children: divisoriaTiles);
          }
        });
  }
}
