import 'package:projeto_imc/enum/status_imc.dart';
import 'package:projeto_imc/models/pessoa_classe.dart';
import 'package:projeto_imc/projeto_imc.dart' as app;
import 'package:test/test.dart';

void main() {
  group('Calculo IMC', () {
    var testes = {
      {"altura": 0, "peso": 80}: throwsA(TypeMatcher<ArgumentError>()),
      {"altura": 1.7, "peso": 0}: throwsA(TypeMatcher<ArgumentError>())
    };

    testes.forEach((values, expected) {
      test('$values - $expected', () {
        expect(
            () => app.calculaIMC(double.parse(values['peso'].toString()),
                double.parse(values['altura'].toString())),
            expected);
      });
    });
  });
  test('Calculo IMC', () {
    expect(app.calculaIMC(80, 1.7), equals(27.68166089965398));
  });

  test('StatusIMC', () {
    var aux = Pessoa("Felipe");
    aux.setAltura(1.7);
    aux.setPeso(80);
    aux.setStatusIMC();
    expect(aux.getStatusIMC(), StatusIMC.SOBREPESO);
  });
}
