import 'package:calculatorapp/container.dart';
import 'package:calculatorapp/main.dart';
import 'package:calculatorapp/size_config.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HOME_PAGE extends StatefulWidget {
  const HOME_PAGE({super.key});

  @override
  State<HOME_PAGE> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HOME_PAGE> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  String result = '';

  void equal_sign_tapped() {
    var question = textEditingController.text.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(question);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: size_config.screen_height! * 0.18,
                  width: size_config.screen_width! * 0.9,
                  child: TextFormField(
                    maxLines: 4,
                    style: const TextStyle(color: Colors.blue, fontSize: 40),
                    controller: textEditingController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: const BorderSide(color: Colors.blue))),
                    keyboardType:
                        const TextInputType.numberWithOptions(signed: true),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10),
                  width: size_config.screen_width! * 0.9,
                  height: size_config.screen_height! * 0.08,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 4, bottom: 6, right: 8, left: 8),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(13)),
                        child: const Center(
                            child: Text(
                          'Result',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Expanded(
                          child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: Center(
                                child: Text(
                                  result,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ))),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    child: GridView.builder(
                        itemCount: 20,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4, childAspectRatio: 1 / 1),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (index == 0) {
                                setState(() {
                                  textEditingController.text = '';
                                  result = '';
                                });
                              } else if (index == 19) {
                                equal_sign_tapped();
                              } else if (index == 1) {
                                setState(() {
                                  textEditingController.text =
                                      textEditingController.text.substring(
                                          0,
                                          textEditingController.text.length -
                                              1);
                                });
                              } else {
                                setState(() {
                                  textEditingController.text =
                                      textEditingController.text +
                                          operators[index];
                                });
                              }
                            },
                            child: CONTAINER(
                                color: (index == 0)
                                    ? const Color.fromARGB(255, 192, 13, 0)
                                    : (index == 1)
                                        ? Colors.green
                                        : (index == 2 ||
                                                index == 3 ||
                                                index == 7 ||
                                                index == 11 ||
                                                index == 15)
                                            ? const Color.fromARGB(
                                                255, 82, 0, 97)
                                            : (index == 19)
                                                ? const Color.fromARGB(
                                                    255, 255, 94, 0)
                                                : Colors.white,
                                text: operators[index],
                                text_color: (index == 0 ||
                                        index == 1 ||
                                        index == 2 ||
                                        index == 3 ||
                                        index == 7 ||
                                        index == 11 ||
                                        index == 15 ||
                                        index == 19)
                                    ? Colors.white
                                    : const Color.fromARGB(255, 93, 0, 109),
                                text_size: (index == 19)
                                    ? 45
                                    : (index == 16)
                                        ? 25
                                        : 15),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
