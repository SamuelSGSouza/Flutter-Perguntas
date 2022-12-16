import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 18) {
      return 'Você é bom!';
    } else if (pontuacao < 25) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          style: TextButton.styleFrom(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          child: const Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
