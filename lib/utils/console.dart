import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String lerConsole() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String lerConsoleComTexto(String texto) {
    print(texto);
    return lerConsole();
  }

  static double? lerDoubleComTexto(String texto, String valorSaida) {
    var sair = false;

    do {
      try {
        var value = lerConsoleComTexto(texto);
        if (value == valorSaida) return null;
        return double.parse(value);
      } catch (e) {
        print(texto);
      }
    } while (!sair);
  }
}
