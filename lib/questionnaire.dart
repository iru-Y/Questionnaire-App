import 'package:flutter/material.dart';
import 'package:perguntas/response.dart';
import 'question.dart';

class Questionnaire extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) answer;

  const Questionnaire(
      {Key? key, required this.questions, required this.selectedQuestion, required this.answer})
      : super(key: key);

  bool get haveASelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = haveASelectedQuestion
        ? questions[selectedQuestion].cast()["answer"] as List<
        Map<String, Object>>
        : [];
    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]["text"].toString()),
        ...answers.map((resp) {
          return Response(
            resp["text"].toString(), () =>
              answer(int.parse(resp["score"].toString())),
          );
        }).toList(),
      ],
    );
  }
}

