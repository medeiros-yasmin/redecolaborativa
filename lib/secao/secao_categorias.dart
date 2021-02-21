import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aplicacao_colaborativa/screens/tela_categoria.dart';

class SecaoCategoria extends StatelessWidget {
  final DocumentSnapshot snapshot;

  SecaoCategoria(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.5,
        backgroundColor: Colors.transparent,
        backgroundImage: NetworkImage(snapshot.data["icone"]),
      ),
      title: Text(snapshot.data["titulo"]),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaCategoria(snapshot)));
      },
    );
  }
}
