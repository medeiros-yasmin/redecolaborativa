import 'package:aplicacao_colaborativa/blocs/publicacao_bloc.dart';
import 'package:aplicacao_colaborativa/validacao/validacao_publicacao.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class TelaEdicaoPublicacao extends StatefulWidget {
  final String idCategoria;
  final DocumentSnapshot publicacao;

  TelaEdicaoPublicacao({this.idCategoria, this.publicacao});

  @override
  _TelaEdicaoPublicacaoState createState() =>
      _TelaEdicaoPublicacaoState(idCategoria, publicacao);
}

class _TelaEdicaoPublicacaoState extends State<TelaEdicaoPublicacao>
    with PublicacaoValidacao {
  final PublicacaoBloc _publicacaoBloc;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldChave = GlobalKey<ScaffoldState>();

  _TelaEdicaoPublicacaoState(String idCategoria, DocumentSnapshot publicacao)
      : _publicacaoBloc =
            PublicacaoBloc(idCategoria: idCategoria, publicacao: publicacao);
  @override
  Widget build(BuildContext context) {
    final _estiloDoCampo = TextStyle(
      color: Colors.white,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    );

    InputDecoration _buildDecoracao(String label) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.cyanAccent),
      );
    }

    return Scaffold(
        key: _scaffoldChave,
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          elevation: 5,
          title: Text("Criar Publicação"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.remove), onPressed: () {}),
            StreamBuilder<bool>(
                stream: _publicacaoBloc.sairCarregamento,
                initialData: false,
                builder: (context, snapshot) {
                  return IconButton(
                    icon: Icon(Icons.save),
                    onPressed: snapshot.data ? null : salvarPublicacao,
                  );
                }),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Form(
              key: _formKey,
              child: StreamBuilder<Map>(
                  stream: _publicacaoBloc.outData,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return Container();
                    return ListView(
                      padding: EdgeInsets.all(18),
                      children: <Widget>[
                        Text(
                          "Imagens",
                          style: TextStyle(color: Colors.cyan, fontSize: 14),
                        ),
                        //ImagensWidget(),
                        TextFormField(
                          initialValue: snapshot.data["titulo"],
                          style: _estiloDoCampo,
                          decoration: _buildDecoracao("Título"),
                          onSaved: _publicacaoBloc.salvarTitulo,
                          validator: validarTitulo,
                        ),
                        TextFormField(
                          initialValue: snapshot.data["descricao"],
                          style: _estiloDoCampo,
                          decoration: _buildDecoracao("Descrição"),
                          maxLines: 4,
                          onSaved: _publicacaoBloc.salvarDescricao,
                          validator: validarDescricao,
                        ),
                        TextFormField(
                          initialValue: snapshot.data["autor"],
                          style: _estiloDoCampo,
                          decoration: _buildDecoracao("Autor"),
                          onSaved: _publicacaoBloc.salvarAutor,
                          validator: validarAutor,
                        ),
                        TextFormField(
                          initialValue: snapshot.data["fonte"],
                          style: _estiloDoCampo,
                          decoration: _buildDecoracao("Fonte"),
                          onSaved: _publicacaoBloc.salvarFonte,
                          validator: validarFonte,
                        ),
                      ],
                    );
                  }),
            ),
            StreamBuilder<bool>(
                stream: _publicacaoBloc.sairCarregamento,
                initialData: false,
                builder: (context, snapshot) {
                  return IgnorePointer(
                    ignoring: !snapshot.data,
                    child: Container(
                        color: snapshot.data
                            ? Colors.black38
                            : Colors.transparent),
                  );
                }),
          ],
        ));
  }

  void salvarPublicacao() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
    _scaffoldChave.currentState.showSnackBar(SnackBar(
        content: Text(
          "Salvando publicação",
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(minutes: 1),
        backgroundColor: Colors.cyan));
    bool success = await _publicacaoBloc.salvarPublicacao();

    _scaffoldChave.currentState.removeCurrentSnackBar();

    _scaffoldChave.currentState.showSnackBar(SnackBar(
      content: Text(
        success ? "Publicação Adicionada" : "Erro ao adicionar publicação",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.cyan,
    ));
  }
}
