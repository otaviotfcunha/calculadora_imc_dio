class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 0.0;

  void setNome(String nome){
    _nome = nome;
  }

  String getNome(){
    return _nome;
  }

  void setPeso(double peso){
    _peso = peso;
  }

  double getPeso(){
    return _peso;
  }

  void setAltura(double altura){
    _altura = altura;
  }

  double getAltura(){
    return _altura;
  }

  void calculaImc(double peso, double altura){
    double imcFinal = peso / (altura * altura);
    _imc = imcFinal;
  }

  double getImc(){
    return _imc;
  }

  @override
  String toString() {
    // TODO: implement toString
    return {
      "Nome": _nome, 
      "Peso": _peso,
      "Altura": _altura,
      "IMC": _imc
    }.toString();
  }


}