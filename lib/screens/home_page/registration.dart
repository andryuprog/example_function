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
          body: BlocBuilder<CalcBlockCubit, CalcBlockState>(
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.only(top: 100.0),
                color: Colors.black54,
                child: Form(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Name *'),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'password *')),
                      const SizedBox(height: 16),
                      TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'password *')),
                      const SizedBox(height: 30),

                      const HistoryButton(
                        text: 'REGISTRATION',
                        textSize: 22,
                        textColor: Colors.white,
                        callback: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const CalculatorApp())),

                      ),


                    ],

                  ),

                ),

              );

            },

          )

      ),
    );
  }
}
