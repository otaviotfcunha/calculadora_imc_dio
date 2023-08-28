class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 0.0;
  String _fraseImc = "";

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

    switch (imcFinal) {
      case < 16:
        _fraseImc = "Magreza grave";
        break;
      case >= 16 && < 17:
        _fraseImc = "Magreza moderada";
        break;
      case >= 17 && < 18.5:
        _fraseImc = "Magreza leve";
        break;
      case >= 18.5 && < 25:
        _fraseImc = "Saudável";
        break;
      case >= 25 && < 30:
        _fraseImc = "Sobrepeso";
        break;
      case >= 30 && < 35:
        _fraseImc = "Obesidade Grau I";
        break;
      case >= 35 && < 40:
        _fraseImc = "Obesidade Grau II (severa)";
        break;
      case >= 40:
        _fraseImc = "Obesidade Grau III (mórbida)";
        break;
      default:
        _fraseImc = "Problema para calcular o IMC.";
        break;
    }
    _imc = imcFinal;
  }

  double getImc(){
    return _imc;
  }

  String getFraseImc(){
    return _fraseImc;
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