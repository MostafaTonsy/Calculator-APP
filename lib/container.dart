import 'package:flutter/material.dart';

class CONTAINER extends StatelessWidget {
  final Color color;
  final String text;
  final Color text_color;
  final double text_size;
  const CONTAINER(
      {super.key,
      required this.color,
      required this.text,
      required this.text_color,
      required this.text_size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(blurRadius: 4)],
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: text_color,
            fontSize: text_size,
          ),
        ),
      ),
    );
  }
}
