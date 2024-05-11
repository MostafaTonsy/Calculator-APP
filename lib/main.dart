import 'package:calculatorapp/HOME_PAGE.dart';
import 'package:calculatorapp/size_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    size_config().init(context);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HOME_PAGE(),
    );
  }
}

List<String> operators = [
  'C',
  'DEL',
  '%',
  '/',
  '1',
  '2',
  '3',
  'x',
  '4',
  '5',
  '6',
  '-',
  '7',
  '8',
  '9',
  '+',
  '.',
  '0',
  'ANS',
  '='
];
