import 'dart:io';

import 'package:calculadora_imc_dio/exception/nome_invalido_exception.dart';
import 'package:calculadora_imc_dio/models/console_utils.dart';
import 'package:calculadora_imc_dio/models/pessoa.dart';

void execute(){
  bool executa = true;
  bool error = false;
  var pessoa = Pessoa();
  print("Bem vindo ao sistema de IMC!");

  do {
    String? nome;
    double? peso;
    double? altura;
    nome = ConsoleUtils.lerStringComTexto("Digite o nome da pessoa que deseja calcular o IMC: ");
    try {
      if(nome.trim() == ""){
        throw NomeInvalidoException();
      }
    } on NomeInvalidoException {
      print(NomeInvalidoException);
      executa = false;
      error = true;
      break;
    } catch (e) {
      print(e);
      executa = false;
      error = true;
      break;
    }
    pessoa.setNome(nome);
    peso = ConsoleUtils.lerDoubleComTextoComSaida("Digite o peso (kg) do ${pessoa.getNome()} ou 'S' para SAIR: ", "S");
    if(peso != null){
      pessoa.setPeso(peso);
    }else{
      executa = false;
      error = true;
      break;
    }
    altura = ConsoleUtils.lerDoubleComTextoComSaida("Digite a altura (metros) do ${pessoa.getNome()} ou 'S' para SAIR: ", "S");
    if(altura != null){
      pessoa.setAltura(altura);
    }else{
      executa = false;
      error = true;
      break;
    }
    if(pessoa.getNome() != null && pessoa.getPeso() != 0.0 && pessoa.getAltura() != 0.0){
      try {
        pessoa.calculaImc(pessoa.getPeso(), pessoa.getAltura());
      } catch (e) {
        print("Erro ao calcular o IMC.");
        error = true;
      }
      executa = false;
    }

  } while (executa);

  if(error){
    print("O sistema será encerrado devido a um erro nos dados.");
    exit(0);
  }else{
    print("-------------------------------------------------");
    print("Os dados digitados do ${pessoa.getNome()} foram: ");
    print("-------------------------------------------------");
    print("Peso: ${pessoa.getPeso()} Kgs.");
    print("Altura: ${pessoa.getAltura()} m.");
    print("-------------------------------------------------");
    print("O IMC do ${pessoa.getNome()} é: ");
    print("-------------------------------------------------");
    print("IMC: ${pessoa.getImc()}");
    print("-------------------------------------------------");
  }


  
  //aluno.aprovado(5.0) ? print("Situação: Aprovado.") : print("Situação: Reprovado.");
}
