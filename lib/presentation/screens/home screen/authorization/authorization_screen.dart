import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/repositories/authorization_repository.dart';
import '../../calc/calc.dart';
import '../../../widgets/history_button.dart';
import '../forgotten/forgotten_password.dart';
import 'authorization_bloc_cubit.dart';
import 'authorization_bloc_state.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController nameConfirmController = TextEditingController();


  @override
  void dispose() {
    passwordConfirmController.dispose();
    nameConfirmController.dispose();
    super.dispose();
  }

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
          body: BlocProvider<AuthorizationBlocCubit>(
            create: (context) =>
                AuthorizationBlocCubit(context.read<AuthorizationRepository>())
                  ..init(),
            child: BlocConsumer<AuthorizationBlocCubit, AuthorizationState>(
                listener: (context, state) {
                                                     // log('state_name_1_${state.runtimeType}');
              if (state is InitializeFieldState) {
                                                    // log('state_name_1_${state.name}');
                nameConfirmController.text = state.name;
              } else if (state is AuthorizationBlocConfirm) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const CalculatorApp()));
              } else if (state is AuthorizationBlocError) {
                const snackBar =
                    SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('ошибка ввода данных'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }, builder: (context, state) {
                                               // log('state_name__${state.runtimeType}');
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      TextFormField(

                        controller: nameConfirmController,
                        decoration:  InputDecoration(
                            labelText: 'Name *',
                            hintText: 'введите ваше имя',
                            prefixIcon: const Icon(Icons.person),
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  nameConfirmController.clear();
                                },
                                child: const Icon(Icons.delete)),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.8),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.8),
                            )),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^\d+$').hasMatch(value)) {
                            return 'неправильные символы';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        controller: passwordConfirmController,
                        decoration: InputDecoration(
                            labelText: 'Password *',
                            hintText: 'введите пароль',
                            prefixIcon: const Icon(Icons.security),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.visibility)),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.8),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.8),
                            )),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                                 context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                         const Forgotten()));
                        },
                        child: const Text('Забыли пароль?'),
                      ),
                      HistoryButton(
                        text: 'AUTHORIZATION',
                        textSize: 15,
                        textColor: Colors.white,
                        callback: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthorizationBlocCubit>().checkFields(
                                nameConfirmController.text,
                                passwordConfirmController.text);

                          } else {
                            const snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('ошибка ввода данных'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          )),
    );
  }

  void _goin() {
    print('такое воооооооот${nameConfirmController.text}');
  }
}
