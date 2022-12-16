import "package:flutter/material.dart";
import './resultado.dart';
import './questionario.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _resetarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {"texto": 'Preto', "nota": 10},
        {"texto": 'Vermelho', "nota": 8},
        {"texto": 'Verde', "nota": 7},
        {"texto": 'Branco', "nota": 6},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {"texto": 'Coelho', "nota": 3},
        {"texto": 'Cobra', "nota": 4},
        {"texto": 'Elefante', "nota": 5},
        {"texto": 'Leão', "nota": 10},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': [
        {"texto": 'Maria', "nota": 1},
        {"texto": 'João', "nota": 10},
        {"texto": 'Leo', "nota": 2},
        {"texto": 'Pedro', "nota": 6},
      ],
    }
  ];
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas'),
          ),
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : Resultado(_pontuacaoTotal, _resetarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
