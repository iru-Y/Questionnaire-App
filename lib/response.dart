import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String text;
  final Function() onSelect;
  const Response(this.text, this.onSelect, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25,
      color: Colors.blue,
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: onSelect,
        child: Text(text)
      ),
    );
  }
}
