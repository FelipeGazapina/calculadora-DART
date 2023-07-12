import 'package:projeto_imc/enum/status_imc.dart';
import 'package:projeto_imc/models/pessoa_classe.dart';
import 'package:projeto_imc/utils/console.dart';

double calculaIMC(double peso, double altura) {
  if (peso <= 0) throw ArgumentError("O peso nao pode ser 0");
  if (altura <= 0) throw ArgumentError("A altura nao pode ser 0");

  return peso / (altura * altura);
}

void execute() {
  print("Seja bem vindo a calculadora de IMC\n");

  dynamic input = ConsoleUtils.lerConsoleComTexto("Qual seu nome?");
  var pessoa = Pessoa(input);

  bool sair = false;
  do {
    input = ConsoleUtils.lerDoubleComTexto(
        "Qual sua altura? (em mentros) S para sair", "S");
    if (input == null) sair = true;
    pessoa.setAltura(input);
    input = ConsoleUtils.lerDoubleComTexto(
        "Qual seu peso? (em kg) S para sair", "S");
    if (input == null) sair = true;
    pessoa.setPeso(input);

    pessoa.setStatusIMC();

    if (pessoa.getStatusIMC() != StatusIMC.NENHUM) {
      print(
          "${pessoa.getNome()} você esta [${pessoa.getStatusIMC()}] seu IMC é: ${pessoa.getIMC()}");
      sair = true;
    }
  } while (!sair);
}
