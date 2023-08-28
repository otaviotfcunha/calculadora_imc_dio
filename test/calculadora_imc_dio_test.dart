import 'package:calculadora_imc_dio/models/pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('testando todas as categorias', () {
    final testData = [
      // Peso, Altura, Categoria Esperada
      [30.0, 1.70, "Magreza grave"],
      [40.0, 1.65, "Magreza grave"],
      [55.0, 1.80, "Magreza moderada"],
      [60.0, 1.90, "Magreza moderada"],
      [45.0, 1.60, "Magreza leve"],
      [60.0, 1.85, "Magreza leve"],
      [60.0, 1.70, "Saudável"],
      [70.0, 1.70, "Saudável"],
      [80.0, 1.75, "Sobrepeso"],
      [85.0, 1.70, "Sobrepeso"],
      [90.0, 1.80, "Sobrepeso"],
      [95.0, 1.75, "Obesidade Grau I"],
      [100.0, 1.80, "Obesidade Grau I"],
      [105.0, 1.75, "Obesidade Grau I"],
      [110.0, 1.77, "Obesidade Grau II (severa)"],
      [120.0, 1.80, "Obesidade Grau II (severa)"],
      [140.0, 1.80, "Obesidade Grau III (mórbida)"],
      [150.0, 1.75, "Obesidade Grau III (mórbida)"],
    ];

    for (var data in testData) {
      Pessoa pessoa = Pessoa();
      double peso = double.parse(data[0].toString());
      double altura = double.parse(data[1].toString());
      String categoriaEsperada = data[2].toString();

      pessoa.calculaImc(peso, altura);
      expect(pessoa.getFraseImc(), equals(categoriaEsperada));
    }
  });
  test('testando categoria "Saudável"', () {
    Pessoa pessoa = Pessoa();
    double peso = 70.0;
    double altura = 1.75;
    pessoa.calculaImc(peso, altura);
    expect(pessoa.getFraseImc(), "Saudável");
    expect(pessoa.getImc(), closeTo(22.857142857142858, 0.001));
  });

  test('testando categoria "Sobrepeso"', () {
    Pessoa pessoa = Pessoa();
    double peso = 90.0;
    double altura = 1.80;
    pessoa.calculaImc(peso, altura);
    expect(pessoa.getFraseImc(), "Sobrepeso");
    expect(pessoa.getImc(), closeTo(27.777777777777775, 0.001));
  });
}