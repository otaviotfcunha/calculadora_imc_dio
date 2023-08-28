class ValorInvalidoException implements Exception{
  String error() => "Valor inválido!";

  @override
  String toString() {
    // TODO: implement toString
    return error();
  }
}