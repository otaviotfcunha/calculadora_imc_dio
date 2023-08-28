import 'dart:convert';
import 'dart:io';

class ConsoleUtils{
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
      } catch (e) {
        print("Digite um valor válido!");
      }
      
    } while (true);
  }
}