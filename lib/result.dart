import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        color: Colors.blue,
        child: Text(text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 28,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
