import 'dart:math';

class GeradorNumeroAleatorioService {
  static int gerarNumero(int numeroMaximo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numeroMaximo);
  }
}
