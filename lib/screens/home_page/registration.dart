import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../calc/calc.dart';
import '../calc/calcBlockCubit.dart';
import '../history/history_block_cubit.dart';
import '../../widgets/history_button.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my calculate',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          secondary: Colors.black87,
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('registration'),
            centerTitle: true,
          ),
          body:
          BlocBuilder<CalcBlockCubit, CalcBlockState>(
            builder: (context, state) {
              return Container(
                  color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Form(
                          child:
                          TextFormField()
                      )


                      HistoryButton(
                        text: 'REGISTRATION',
                        textSize: 22,
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const CalculatorApp()));
                          //context.read<HistoryBlockCubit>().getOperationList();
                        },
                      ),
                    ],
                  )
              );
            },
          )),
    );
  }
}
