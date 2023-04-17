import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.score, required this.restart}) : super(key: key);

  final int score;
  final void Function() restart;

  String get phraseResult{
    if (score < 8){
      return "Yan";
    } else if(score < 12){
      return "Aumiraci";
    } else if (score < 16){
      return "Valdeci";
    } else {
      return "Yuri";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: Center(
              child: Text(phraseResult,
                style: const TextStyle(fontSize: 28,
                    color: Colors.white
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButtonTheme(
            data: const TextButtonThemeData(
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.black),
                    textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 25))
                )
            ),
            child: Column(
              children: <Widget>[
                TextButton(onPressed: restart, child: const Text("Reiniciar?"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
