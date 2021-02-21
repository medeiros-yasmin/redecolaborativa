import 'package:aplicacao_colaborativa/dados/dado_leitura.dart';
import 'package:aplicacao_colaborativa/secao/secao_produto.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TelaCategoria extends StatelessWidget {
  final DocumentSnapshot snapshot;

  TelaCategoria(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data["titulo"]),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.cyan,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.grid_on),
                ),
                Tab(
                  icon: Icon(Icons.list),
                )
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("categorias")
                  .document(snapshot.documentID)
                  .collection("itens")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return TabBarView(children: [
                    GridView.builder(
                        padding: EdgeInsets.all(4.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return SecaoProduto(
                              "grid",
                              DadoProduto.fromDocument(
                                  snapshot.data.documents[index]));
                        }),
                    ListView.builder(
                        padding: EdgeInsets.all(3.0),
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return SecaoProduto(
                              "list",
                              DadoProduto.fromDocument(
                                  snapshot.data.documents[index]));
                        })
                  ]);
              })),
    );
  }
}
