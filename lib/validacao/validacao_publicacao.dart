class PublicacaoValidacao {
  String validarTitulo(String texto) {
    if (texto.isEmpty) return "Preencha o campo de título solicitado!";
    return null;
  }

  String validarDescricao(String descricao) {
    if (descricao.isEmpty) return "Preencha o campo de descrição solicitado!";
    return null;
  }

  String validarAutor(String autor) {
    if (autor.isEmpty) return "Preencha o campo de autor solicitado!";
    return null;
  }

  String validarFonte(String fonte) {
    if (fonte.isEmpty) return "Preencha o campo de fonte solicitado!";
    return null;
  }
}
