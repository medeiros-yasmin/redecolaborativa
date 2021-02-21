import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/subjects.dart';

class PublicacaoBloc extends BlocBase {
  final _dataController = BehaviorSubject<Map>();
  final _controllerCarregando = BehaviorSubject<bool>();

  Stream<Map> get outData => _dataController.stream;
  Stream<bool> get sairCarregamento => _controllerCarregando.stream;
  String idCategoria;
  DocumentSnapshot publicacao;

  Map<String, dynamic> dadoNaoSalvo;

  PublicacaoBloc({this.idCategoria, this.publicacao}) {
    if (publicacao != null) {
      dadoNaoSalvo = Map.of(publicacao.data);
      dadoNaoSalvo["imagens"] = List.of(publicacao.data["imagens"]);
    } else {
      dadoNaoSalvo = {
        "titulo": null,
        "descricao": null,
        "autor": null,
        "imagens": [],
        "fonte": null
      };
    }
    _dataController.add(dadoNaoSalvo);
  }

  void salvarTitulo(String titulo) {
    dadoNaoSalvo["titulo"] = titulo;
  }

  void salvarDescricao(String descricao) {
    dadoNaoSalvo["descricao"] = descricao;
  }

  void salvarImagens(String imagens) {
    dadoNaoSalvo["imagens"] = imagens;
  }

  void salvarAutor(String autor) {
    dadoNaoSalvo["autor"] = autor;
  }

  void salvarFonte(String fonte) {
    dadoNaoSalvo["fonte"] = fonte;
  }

  Future<bool> salvarPublicacao() async {
    _controllerCarregando.add(true);
    try {
      if (publicacao != null) {
        await publicacao.reference.updateData(dadoNaoSalvo);
      } else {
        DocumentReference dr = await Firestore.instance
            .collection("categorias")
            .document(idCategoria)
            .collection("itens")
            .add(Map.from(dadoNaoSalvo));

        await dr.updateData(dadoNaoSalvo);
      }
      _controllerCarregando.add(false);
      return true;
    } catch (e) {
      _controllerCarregando.add(false);
      return false;
    }
  }

  @override
  void dispose() {
    _dataController.close();
  }
}
