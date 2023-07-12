import 'package:projeto_imc/enum/status_imc.dart';
import 'package:projeto_imc/projeto_imc.dart';

class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 0.0;
  StatusIMC _statusIMC = StatusIMC.NENHUM;

  Pessoa(this._nome);

  void setNome(String nome) {
    _nome = nome;
  }

  String getNome() {
    return _nome;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double getPeso() {
    return _peso;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  double getAltura() {
    return _altura;
  }

  void setStatusIMC() {
    double imc = calculaIMC(_peso, _altura);
    _imc = imc;
    switch (imc) {
      case < 16:
        _statusIMC = StatusIMC.MAGREZA_GRAVE;
        break;
      case >= 16 && < 17:
        _statusIMC = StatusIMC.MAGREZA_MODERADA;
        break;
      case >= 17 && < 18.5:
        _statusIMC = StatusIMC.MAGREZA_LEVE;
        break;
      case >= 18.5 && < 25:
        _statusIMC = StatusIMC.SAUDAVEL;
        break;
      case >= 25 && < 30:
        _statusIMC = StatusIMC.SOBREPESO;
        break;
      case >= 30 && < 35:
        _statusIMC = StatusIMC.OBESIDADE_I;
        break;
      case >= 35 && < 40:
        _statusIMC = StatusIMC.OBESIDADE_II;
        break;
      case >= 40:
        _statusIMC = StatusIMC.OBESIDADE_III;
        break;
      default:
    }
  }

  StatusIMC getStatusIMC() {
    return _statusIMC;
  }

  double getIMC() {
    return _imc;
  }

  @override
  String toString() {
    return "$_nome seu IMC é $_imc";
  }
}
