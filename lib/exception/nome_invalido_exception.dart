class NomeInvalidoException implements Exception{
  String error() => "Nome inválido!";

  @override
  String toString() {
    // TODO: implement toString
    return error();
  }
}