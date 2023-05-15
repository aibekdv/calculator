import 'package:calculator/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(
      () {
        if (buttonText == "C") {
          equation = "0";
          result = "0";
          equationFontSize = 38.0;
          resultFontSize = 48.0;
        } else if (buttonText == "⌫") {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          equation = equation.substring(0, equation.length - 1);
          if (equation == "") {
            equation = "0";
          }
        } else if (buttonText == "=") {
          equationFontSize = 38.0;
          resultFontSize = 48.0;

          expression = equation;
          expression = expression.replaceAll('×', '*');
          expression = expression.replaceAll('÷', '/');

          try {
            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            result = "Error";
          }
        } else {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          if (equation == "0") {
            equation = buttonText;
          } else {
            equation = equation + buttonText;
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Table(
                  children: [
                    TableRow(children: [
                      CustomButton(
                        buttonText: "C",
                        buttonHeight: 1,
                        buttonColor: Colors.redAccent,
                        onPressed: () => buttonPressed('C'),
                      ),
                      CustomButton(
                        buttonText: "⌫",
                        buttonHeight: 1,
                        buttonColor: Colors.blue,
                        onPressed: () => buttonPressed('⌫'),
                      ),
                      CustomButton(
                        buttonText: "÷",
                        buttonHeight: 1,
                        buttonColor: Colors.blue,
                        onPressed: () => buttonPressed('÷'),
                      ),
                    ]),
                    TableRow(children: [
                      CustomButton(
                        buttonText: "7",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('7'),
                      ),
                      CustomButton(
                        buttonText: "8",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('8'),
                      ),
                      CustomButton(
                        buttonText: "9",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('9'),
                      ),
                    ]),
                    TableRow(children: [
                      CustomButton(
                        buttonText: "4",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('4'),
                      ),
                      CustomButton(
                        buttonText: "5",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('5'),
                      ),
                      CustomButton(
                        buttonText: "6",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('6'),
                      ),
                    ]),
                    TableRow(children: [
                      CustomButton(
                        buttonText: "1",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('1'),
                      ),
                      CustomButton(
                        buttonText: "2",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('2'),
                      ),
                      CustomButton(
                        buttonText: "3",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('3'),
                      ),
                    ]),
                    TableRow(children: [
                      CustomButton(
                        buttonText: ".",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('.'),
                      ),
                      CustomButton(
                        buttonText: "0",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('0'),
                      ),
                      CustomButton(
                        buttonText: "00",
                        buttonHeight: 1,
                        buttonColor: Colors.black54,
                        onPressed: () => buttonPressed('00'),
                      ),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      CustomButton(
                        buttonText: "×",
                        buttonHeight: 1,
                        buttonColor: Colors.blue,
                        onPressed: () => buttonPressed('×'),
                      ),
                    ]),
                    TableRow(children: [
                      CustomButton(
                        buttonText: "-",
                        buttonHeight: 1,
                        buttonColor: Colors.blue,
                        onPressed: () => buttonPressed('-'),
                      ),
                    ]),
                    TableRow(children: [
                      CustomButton(
                        buttonText: "+",
                        buttonHeight: 1,
                        buttonColor: Colors.blue,
                        onPressed: () => buttonPressed('+'),
                      ),
                    ]),
                    TableRow(
                      children: [
                        CustomButton(
                          buttonText: "=",
                          buttonHeight: 2,
                          buttonColor: Colors.redAccent,
                          onPressed: () => buttonPressed('='),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
