import 'package:flutter/material.dart';
import 'package:perguntas/questionnaire.dart';
import 'package:perguntas/result.dart';

void main() => runApp(const QuestionApp());

class QuestionApp extends StatefulWidget {
  const QuestionApp({Key? key}) : super(key: key);

  @override
  _QuestionAppState createState() => _QuestionAppState();
}

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      "text": "Qual é sua cor favorita?",
      "answer": [
        {"text": "Preto ", "score": 10},
        {"text": "Vermelho", "score": 5},
        {"text": "Verde ", "score": 3},
        {"text": "Branco ", "score": 1}
      ],
    },
    {
      "text": "Qual é seu animal favorito?",
      "answer": [
        {"text": "Leão", "score": 10},
        {"text": "Cabra", "score": 5},
        {"text": "Bode", "score": 3},
        {"text": "Avestruz", "score": 1}
      ],
    },
    {
      "text": "Qual é seu instrutor favorito?",
      "answer": [
        {"text": "Yuri", "score": 10},
        {"text": "Matheus", "score": 5},
        {"text": "Carlos", "score": 3},
        {"text": "Yan", "score": 1},
      ],
    }
  ];

  void _restart(){
   setState(() {
     _selectedQuestion = 0;
     _totalScore = 0;
   });
  }

  void _answer(int totalScore) {
    if (haveASelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalScore += totalScore;
      });
    }
  }

  bool get haveASelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Perguntas"),
          ),
          body: haveASelectedQuestion
              ? Questionnaire(
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                  answer: _answer)
              : Result(score: _totalScore, restart: _restart,)),
    );
  }
}
