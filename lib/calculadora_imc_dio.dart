import 'dart:io';

import 'package:calculadora_imc_dio/models/utils.dart';
import 'package:calculadora_imc_dio/models/pessoa.dart';

void execute(){
  var pessoa = Pessoa();
  print("Bem vindo ao sistema de IMC!");

  String? nome = Utils.lerStringComTexto("Digite o nome da pessoa que deseja calcular o IMC: ");
  if (Utils.verificaNome(nome) == true) {
    pessoa.setNome(nome);
  } else {
    print("Nome inválido. O sistema será encerrado.");
    exit(0);
  }

  double? peso = Utils.lerDoubleComTextoComSaida("Digite o peso (kg) do ${pessoa.getNome()} ou 'S' para SAIR: ", "S");
  if (peso == null) {
    print("O sistema será encerrado.");
    exit(0);
  }
  pessoa.setPeso(peso);

  double? altura = Utils.lerDoubleComTextoComSaida("Digite a altura (metros) do ${pessoa.getNome()} ou 'S' para SAIR: ", "S");
  if (altura == null) {
    print("O sistema será encerrado.");
    exit(0);
  }
  pessoa.setAltura(altura);

  try {
    pessoa.calculaImc(pessoa.getPeso(), pessoa.getAltura());
    print("-------------------------------------------------");
    print("Os dados digitados do(a) ${pessoa.getNome()} foram: ");
    print("-------------------------------------------------");
    print("Peso: ${pessoa.getPeso()} Kgs.");
    print("Altura: ${pessoa.getAltura()} m.");
    print("-------------------------------------------------");
    print("O IMC do ${pessoa.getNome()} é: ");
    print("-------------------------------------------------");
    print("IMC: ${pessoa.getImc()}");
    print("Estado: ${pessoa.getFraseImc()}");
    print("-------------------------------------------------");
  } catch (e) {
    print("Erro ao calcular o IMC.");
  }

}

