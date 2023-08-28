import 'dart:convert';
import 'dart:io';

import 'package:calculadora_imc_dio/exception/nome_invalido_exception.dart';
import 'package:calculadora_imc_dio/exception/valor_invalido_exception.dart';

class Utils{
  static String lerString(){
    return stdin.readLineSync(encoding:utf8) ?? "";
  }
  static String lerStringComTexto(String texto){
    print(texto);
    return stdin.readLineSync(encoding:utf8) ?? "";
  }
  static double? lerDouble(){
    var valor = lerString();
    try {
      return double.parse(valor);
    } catch (e) {
      return null;
    }
  }
  static double? lerDoubleComTexto(String texto){
    print(texto);
    return lerDouble();
  }
  static double? lerDoubleComTextoComSaida(String texto, String valorSaida){
    do {
      try {
        var valor = lerStringComTexto(texto);
        if(valor.toUpperCase() == valorSaida.toUpperCase()){
          return null;
        }else{
          return double.parse(valor);
        }
      } on ValorInvalidoException{
        print(ValorInvalidoException);
      } catch (e) {
        print("Digite um valor válido!");
      }
      
    } while (true);
  }
  static bool? verificaNome(String nome){
    bool retorno = true;
    try {
      if(nome.trim() == ""){
        throw NomeInvalidoException();
      }
    } on NomeInvalidoException {
      print(NomeInvalidoException);
      retorno = false;
    } catch (e) {
      print(e);    
      retorno = false;  
    }
    return retorno;
  }
}