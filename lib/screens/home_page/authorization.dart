
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/screens/home_page/home_bloc_cubit.dart';

import '../calc/calc.dart';
import '../calc/calcBlockCubit.dart';
import '../../widgets/history_button.dart';
import '../history/history_block_cubit.dart';
import '../history/weather_screen.dart';
import 'home_bloc_state.dart';

class Authorization extends StatelessWidget {
   Authorization({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
          title: const Text('authorization'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black54,
        body: BlocBuilder<HomeBlocCubit, HomeBlocState>(
          builder: (context, state) {
            return Form(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    TextFormField(
                      initialValue: context.read<HomeBlocCubit>().homeRepository.resultPreferencesName,
                      decoration: const InputDecoration(
                          labelText:  'Name *',
                          hintText: 'введите ваше имя',
                          prefixIcon: Icon(Icons.person),
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
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'неправильный пароль';
                        } else {
                          return null;
                        }
                      },
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

                    HistoryButton(
                      text: 'AUTHORIZATION',
                      textSize: 15,
                      textColor: Colors.white,
                      callback: ()async {
                        if (_formKey.currentState!.validate()) {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const CalculatorApp()));
                         // context.read<HistoryBlockCubit>().getOperationList();
                        } else {
                          const snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('ошибка ввода данных'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                        //context.read<HomeBlocCubit>().addPasswordPreferences(passwordController.text);
                       // context.read<HomeBlocCubit>().addNamePreferences(nameController.text);
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
