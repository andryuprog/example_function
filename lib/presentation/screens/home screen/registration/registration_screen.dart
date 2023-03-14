import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/history_button.dart';
import '../history/history_block_cubit.dart';
import 'authorization_screen.dart';
import 'registration_bloc_cubit.dart';
import 'registration_bloc_state.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => RegistrationState();
}

class RegistrationState extends State<Registration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    passwordController2.dispose();
    super.dispose();
  }

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
        body: BlocBuilder<RegistrationBlocCubit, RegistrationBlocState>(
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
                      } else {
                        return null;
                      }
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Name *',
                        hintText: 'введите ваше имя',
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              nameController.clear();
                            },
                            child: const Icon(Icons.delete)),
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
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'неправильный пароль';
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController,
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
                      } else if (passwordController2.text !=
                          passwordController.text) {
                        return 'пароли не совпадают';
                      } else {
                        return null;
                      }
                    },
                    controller: passwordController2,
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
                    textSize: 15,
                    textColor: Colors.white,
                    callback: () async {
                      if (_formKey.currentState!.validate()) {
                        const snackBar =
                            SnackBar(content: Text('сохранение данных в базу'));
                        //const Duration(milliseconds: 500 );
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
                      context
                          .read<RegistrationBlocCubit>()
                          .addPa(passwordController.text);
                      context
                          .read<RegistrationBlocCubit>()
                          .addNamePreferences(nameController.text);
                      context.read<RegistrationBlocCubit>().passwordComparison(
                          nameController.text, passwordController.text);
                      //print(' все выглядит так...${context.read<HomeBlocCubit>().getPasswordPreferences()}');
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
