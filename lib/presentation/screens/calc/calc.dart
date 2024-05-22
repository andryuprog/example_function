import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../history/history_block_cubit.dart';
import '../weather/weather_screen.dart';
import 'calcBlockCubit.dart';
import '../../widgets/calculator_button.dart';
import '../../widgets/history_button.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: const Text('my calculate'),
            centerTitle: true,
          ),
          body: BlocBuilder<CalcBlocCubit, CalcBlocState>(
            builder: (context, state) {
              return Container(
                  color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: const Alignment(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text(
                            context.read<CalcBlocCubit>().history,
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      BlocBuilder<CalcBlocCubit, CalcBlocState>(
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
                              maxLines: 1,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 70,
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
                            textSize: 20,
                            callback: () {
                              context.read<CalcBlocCubit>().clearCalcController();
                            },
                          ),
                          CalculatorButton(
                            text: 'C',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .clearCalcController();
                            },
                          ),
                          CalculatorButton(
                            text: '<',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .clearOneCalcController();
                            },
                          ),
                          CalculatorButton(
                            text: '/',
                            textSize: 26,
                            callback: () {
                              context.read<CalcBlocCubit>().divide(
                                  context.read<CalcBlocCubit>().textToDisplay);
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('');
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            text: '9',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('9');
                              // block.textToDisplay = '9';
                            },
                          ),
                          CalculatorButton(
                            text: '8',
                            textSize: 26,
                            callback: () {
                              context.read<CalcBlocCubit>().addCalcController('8');
                            },
                          ),
                          CalculatorButton(
                            text: '7',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('7');
                            },
                          ),
                          CalculatorButton(
                            text: '*',
                            textSize: 26,
                            callback: () {
                              context.read<CalcBlocCubit>().multiply(
                                  context.read<CalcBlocCubit>().textToDisplay);
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('');
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            text: '6',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('6');
                            },
                          ),
                          CalculatorButton(
                            text: '5',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('5');
                            },
                          ),
                          CalculatorButton(
                            text: '4',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('4');
                            },
                          ),
                          CalculatorButton(
                            text: '-',
                            textSize: 26,
                            callback: () {
                              context.read<CalcBlocCubit>().subtract(
                                  context.read<CalcBlocCubit>().textToDisplay);
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('');
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            text: '3',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('3');
                            },
                          ),
                          CalculatorButton(
                            text: '2',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('2');
                            },
                          ),
                          CalculatorButton(
                            text: '1',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('1');
                            },
                          ),
                          CalculatorButton(
                            text: '+',
                            textSize: 26,
                            callback: () {
                              context.read<CalcBlocCubit>().plus(
                                  context.read<CalcBlocCubit>().textToDisplay);
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('');
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CalculatorButton(
                            text: '+/-',
                            textSize: 20,
                            callback: () => {
                              context
                                  .read<CalcBlocCubit>()
                                  .minusCalcController()
                            },
                          ),
                          CalculatorButton(
                            text: '0',
                            textSize: 26,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('0');
                            },
                          ),
                          CalculatorButton(
                            text: '00',
                            textSize: 22,
                            callback: () {
                              context
                                  .read<CalcBlocCubit>()
                                  .addCalcController('00');
                            },
                          ),
                          CalculatorButton(
                            text: '=',
                            textSize: 26,
                            callback: () async {
                              context.read<CalcBlocCubit>().textToDisplay =
                                  context.read<CalcBlocCubit>().calc(context.read<CalcBlocCubit>().textToDisplay);
                              context.read<CalcBlocCubit>().addCalcController('');
                              context.read<CalcBlocCubit>().isClear = true;

                              await Future.delayed(const Duration(seconds: 2));
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
                                  builder: (BuildContext context) =>
                                      const HistoryPage()));
                          context.read<HistoryBlockCubit>().getOperationList();
                        },
                      ),
                    ],
                  ));
            },
          ));
    // );
  }
}
