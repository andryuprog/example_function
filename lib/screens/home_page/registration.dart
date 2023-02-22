import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/screens/home_page/home_bloc_cubit.dart';
import 'package:my_calculate/screens/home_page/home_bloc_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/history_button.dart';
import '../calc/calc.dart';
import '../history/history_block_cubit.dart';
import 'authorization.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  static const String namePrefKey = 'name_pref';
  static const String passwordPrefKey = 'password_pref';

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late SharedPreferences _pref;

  bool _hidePass = true;
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
          title: const Text('registration'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black54,
        body: BlocBuilder<HomeBlocCubit, HomeBlocState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return 'пожалуйста введите правильное имя';
                      }
                      else {
                        return null;
                      }
                    },
                    controller: context.read<HomeBlocCubit>().nameController,
                    decoration: const InputDecoration(
                        labelText: 'Name *',
                        hintText: 'введите ваше имя',
                        prefixIcon: Icon(Icons.person),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.8),
                        )),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'неправильный пароль';
                      }
                      if (value !=
                          context
                              .read<HomeBlocCubit>()
                              .passwordController2
                              .text) {
                        return 'пароли не совпадают';
                      }

                      else {
                        return null;
                      }
                    },
                    controller:
                        context.read<HomeBlocCubit>().passwordController,
                    keyboardType: TextInputType.number,
                    obscureText: _hidePass,
                    maxLength: 5,
                    decoration: InputDecoration(
                        labelText: 'Password *',
                        hintText: 'введите пароль',
                        prefixIcon: const Icon(Icons.security_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(_hidePass
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            // context.read<HomeBlocCubit>().editorSee();
                            setState(() {
                              _hidePass = !_hidePass;
                            });
                          },
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.8),
                        )),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'неправильный пароль';
                      }
                      return null;
                    },
                    controller:
                        context.read<HomeBlocCubit>().passwordController2,
                    keyboardType: TextInputType.number,
                    obscureText: _hidePass,
                    maxLength: 5,
                    decoration: InputDecoration(
                        labelText: 'Password *',
                        hintText: 'повторите пароль',
                        prefixIcon: const Icon(Icons.security_outlined),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility)),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.8),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.8),
                        )),
                  ),
                  HistoryButton(
                    text: 'REGISTRATION',
                    textSize: 20,
                    textColor: Colors.white,
                    callback: () async {
                      if (_formKey.currentState!.validate()) {
                        const snackBar =
                            SnackBar(content: Text('сохранение данных в базу'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Authorization()));
                        context.read<HistoryBlockCubit>().getOperationList();
                      } else {
                        const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('ошибка ввода данных'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
