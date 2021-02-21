import 'package:cloud_firestore/cloud_firestore.dart';

class DadoProduto {
  String id;
  String titulo;
  String descricao;
  String fonte;
  String autor;
  String categoria;
  List imagens;

  DadoProduto.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    titulo = snapshot.data["titulo"];
    descricao = snapshot.data["descricao"];
    fonte = snapshot.data["fonte"];
    autor = snapshot.data["autor"];
    imagens = snapshot.data["imagens"];
    //categoria = snapshot.data["categoria"];
  }
}
