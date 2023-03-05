
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../calc/calc.dart';
import '../calc/calcBlockCubit.dart';
import '../../widgets/history_button.dart';
import '../history/history_block_cubit.dart';
import '../weather/weather_screen.dart';

class Forgotten extends StatelessWidget {
  const Forgotten({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my calculate',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.black87,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('password recovery'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black54,
        body: BlocBuilder<CalcBlockCubit, CalcBlockState>(
          builder: (context, state) {
            return Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText:  'Name *',
                          hintText: 'введите ваше имя',
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: Icon(Icons.delete),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white,width: 0.8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white,width: 0.8),
                          )
                      ),

                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration:  InputDecoration(
                          labelText:  'Password *',
                          hintText: 'введите пароль',
                          prefixIcon: const Icon(Icons.security),
                          suffixIcon: IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.visibility)),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white,width: 0.8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.white,width: 0.8),
                          )
                      ),

                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Забыли пароль?'),
                    ),


                    const Spacer(),
                    HistoryButton(
                      text: 'AUTHORIZATION',
                      textSize: 20,
                      textColor: Colors.white,
                      callback: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                const CalculatorApp()));
                        context.read<HistoryBlockCubit>().getOperationList();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
