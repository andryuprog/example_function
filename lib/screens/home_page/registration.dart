import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/screens/home_page/home_bloc_cubit.dart';
import 'package:my_calculate/screens/home_page/home_bloc_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/history_button.dart';

class Registration extends StatelessWidget {
  Registration({Key? key}) : super(key: key);

  late SharedPreferences _pref;
  static const String namePrefKey = 'name_pref';
  static const String passwordPrefKey = 'password_pref';

  //final String _userName = '';
  //final String _password = '';
  bool _hidePass = true;
  final _nameController = TextEditingController();
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
            return Form(key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const SizedBox(height: 40),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(
                          value)) {
                        return 'пожалуйста введите правильное имя';
                      } else {
                        return null;
                      }
                    },
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: 'Name *',
                        hintText: 'введите ваше имя',
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete)),
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
                    //controller: ,
                    keyboardType: TextInputType.number,
                    obscureText: _hidePass,
                    maxLength: 5,
                    decoration: InputDecoration(
                        labelText: 'Password *',
                        hintText: 'введите пароль',
                        prefixIcon: const Icon(Icons.security_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(_hidePass ? Icons.visibility : Icons
                              .visibility_off),
                          onPressed: () {
                           // _hidePass = !_hidePass;
                            context.read<HomeBlocCubit>().editorSee();
                           // setState(() {

                           // });
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
                    //controller: ,
                    keyboardType: TextInputType.number,
                    obscureText: _hidePass,
                    maxLength: 5,
                    decoration: InputDecoration(
                        labelText: 'Password *',
                        hintText: 'введите пароль',
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
                        //  const snackBar = SnackBar(content: Text('сохранение данных'));
                        // _scaffoldKey.currentState!;
                      }
                      //  _addNamePref(_nameController.text);
                      //  _addPasswordPref;
                      //   print('имя пользователя $_addNamePref');
                      //  print('пароль пользователя $_addPasswordPref');
                      // print('имя пользователя Controller ${_nameController.text}');
                      //  log('$_addNamePref');
                      //
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (BuildContext context) =>
                      //           const CalculatorApp()));
                      //   context.read<HistoryBlockCubit>().getOperationList();
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

  Future _addNamePref(String string) async {
    await _pref.setString(namePrefKey, string);
    _loadNamePref();
  }

  Future _addPasswordPref(String string) async {
    await _pref.setString(passwordPrefKey, string);
  }

  void _loadNamePref() {
    // void addPref () {
    //   _nameController.text;
    // }

  }
}
