import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import '../../db/database.dart';
import '../../model/history_db.dart';
import '../history/history_block.dart';
import 'calcBlock.dart';
import '../../widgets/calculator_button.dart';
import '../../widgets/history_button.dart';
import '../history/weather_forecast_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'my calculate',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(
            secondary: Colors.black87,
          ),
          // secondary:  Color.red,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const CalculatorApp(),
          '/two_pages': (context) => const TwoPages(),
        });
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var block = CalcBlock();
  //var history = BlockHistoryDb ();
  var textToDisplay = '';
 // var historyDatabase = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my calculate'),
        centerTitle: true,
      ),
      body: Container(
          color: Colors.black54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                   block.history,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                alignment: const Alignment(1.0, 1.0),
                child: block.isProgress
                    ? const Center(child: CircularProgressIndicator())
                    : Text(
                        textToDisplay,
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 80,
                        ),
                      ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: 'AC',
                    fillColor: Colors.red,
                    //  textColor: Colors.grey,
                    textSize: 28,
                    callback: () {
                      setState(() {
                        textToDisplay = '';
                        //block.clean();
                      });
                    },
                  ),
                  CalculatorButton(
                    text: 'C',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '';
                        //block.clean();
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '<',
                    textSize: 30,
                    callback: () {
                       textToDisplay.substring(0, textToDisplay.length - 1);
                    },
                  ),
                  CalculatorButton(
                    text: '/',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        block.divide(textToDisplay);
                        textToDisplay = '';
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '9',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}9';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '8',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}8';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '7',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}7';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '*',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        block.multiply(textToDisplay);
                        textToDisplay = '';
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '6',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}6';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '5',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}5';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '4',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}4';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '-',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        block.subtract(textToDisplay);
                      //  print("$textToDisplay");
                        textToDisplay = '';
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '3',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}3';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '2',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}2';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '1',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}1';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '+',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        block.plus(textToDisplay);
                        textToDisplay = '';
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                    text: '+/-',
                    textSize: 28,
                    callback: () => {},
                  ),
                  CalculatorButton(
                    text: '0',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}0';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '00',
                    textSize: 30,
                    callback: () {
                      setState(() {
                        textToDisplay = '${textToDisplay}00';
                      });
                    },
                  ),
                  CalculatorButton(
                    text: '=',
                    textSize: 30,
                    callback: () async {
                      setState(() {
                        textToDisplay = block.calc(textToDisplay);

                      });

                      await Future.delayed(const Duration(seconds: 1));
                     // history.initStateOperationsList();
                      // setState(() {
                      //   textToDisplay = block.res;
                      //   block.isProgress = false;
                      //   block.isClear = true;
                      // }),

                    },
                  ),
                ],
              ),
              HistoryButton(
                text: 'HISTORY',
                textSize: 22,
                callback: () {
                  Navigator.pushNamed(context, '/two_pages');
                },
              ),
            ],
          )),
    );
  }

// setState(() {
// isProgress = true;
// isClear = true;
// });

// void clear() {
//   if (isClear) {
//     textToDisplay = '';
//     block.isClear = false;
//   }
// }
}
