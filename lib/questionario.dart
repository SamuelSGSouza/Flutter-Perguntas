import 'package:flutter/material.dart';
import './resposta.dart';
import './questoes.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> respostas =
        perguntas[perguntaSelecionada].cast()['respostas'];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas
            .map((resp) => Resposta(
                resp['texto'] as String, () => responder(resp['nota'] as int)))
            .toList(),
      ],
    );
  }
}
