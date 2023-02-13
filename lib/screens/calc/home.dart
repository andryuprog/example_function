import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/screens/history/weather_screen.dart';
import 'calcBlockCubit.dart';
import '../../widgets/calculator_button.dart';
import '../../widgets/history_button.dart';

class CalculatorApp extends StatelessWidget {
  CalculatorApp({Key? key}) : super(key: key);

  //CalcBlockCubit block =CalcBlockCubit();

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
      home: Scaffold(
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
                        context.read<CalcBlockCubit>().history,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<CalcBlockCubit, CalcBlockState>(
                      //stream: block.streamCalcController.stream,
                      //bloc: block,
                      builder: (context, state) {
                    if (state is CalcBlocData) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        alignment: const Alignment(1.0, 1.0),
                        child: Text(
                          state.text,

                          //(snapshot.hasData ?? false) ? snapshot.data! : "0",
                          maxLines: 1,
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                          ),
                        ),
                      );
                    } else {
                      return const Text('');
                    }
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: 'AC',
                        fillColor: Colors.red,
                        //  textColor: Colors.grey,
                        textSize: 28,
                        callback: () {
                          context.read<CalcBlockCubit>().clearCalcController();
                        },
                      ),
                      CalculatorButton(
                        text: 'C',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().clearCalcController();
                        },
                      ),
                      CalculatorButton(
                        text: '<',
                        textSize: 30,
                        callback: () {
                          context
                              .read<CalcBlockCubit>()
                              .clearOneCalcController();
                        },
                      ),
                      CalculatorButton(
                        text: '/',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().divide(
                              context.read<CalcBlockCubit>().textToDisplay);
                          context.read<CalcBlockCubit>().addCalcController('');
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
                          context.read<CalcBlockCubit>().addCalcController('9');
                          // block.textToDisplay = '9';
                        },
                      ),
                      CalculatorButton(
                        text: '8',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().addCalcController('8');
                        },
                      ),
                      CalculatorButton(
                        text: '7',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().addCalcController('7');
                        },
                      ),
                      CalculatorButton(
                        text: '*',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().multiply(
                              context.read<CalcBlockCubit>().textToDisplay);
                          context.read<CalcBlockCubit>().addCalcController('');
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
                          context.read<CalcBlockCubit>().addCalcController('6');
                        },
                      ),
                      CalculatorButton(
                        text: '5',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().addCalcController('5');
                        },
                      ),
                      CalculatorButton(
                        text: '4',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().addCalcController('4');
                        },
                      ),
                      CalculatorButton(
                        text: '-',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().subtract(
                              context.read<CalcBlockCubit>().textToDisplay);
                          context.read<CalcBlockCubit>().addCalcController('');
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
                          context.read<CalcBlockCubit>().addCalcController('3');
                        },
                      ),
                      CalculatorButton(
                        text: '2',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().addCalcController('2');
                        },
                      ),
                      CalculatorButton(
                        text: '1',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().addCalcController('1');
                        },
                      ),
                      CalculatorButton(
                        text: '+',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().plus(
                              context.read<CalcBlockCubit>().textToDisplay);
                          context.read<CalcBlockCubit>().addCalcController('');
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
                        callback: () => {
                          context.read<CalcBlockCubit>().minusCalcController()
                        },
                      ),
                      CalculatorButton(
                        text: '0',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>().addCalcController('0');
                        },
                      ),
                      CalculatorButton(
                        text: '00',
                        textSize: 30,
                        callback: () {
                          context.read<CalcBlockCubit>()
                              .addCalcController('00');
                        },
                      ),
                      CalculatorButton(
                        text: '=',
                        textSize: 30,
                        callback: () async {
                          context.read<CalcBlockCubit>().textToDisplay = context
                              .read<CalcBlockCubit>().calc(context.read<CalcBlockCubit>().textToDisplay);
                          context.read<CalcBlockCubit>().addCalcController('');

                          await Future.delayed(const Duration(seconds: 1));
                        },
                      ),
                    ],
                  ),
                  HistoryButton(
                    text: 'HISTORY',
                    textSize: 22,
                    callback: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => TwoPages()));
                      context.read<CalcBlockCubit>().rep.getOperationDb();
                    },
                  ),
                ],
              ))),
    );
  }
}
