

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../calc/calc.dart';

import '../../widgets/history_button.dart';
import '../history/history_block_cubit.dart';
import 'authorization.dart';

class Registration extends StatefulWidget {
   const Registration({Key? key}) : super(key: key);


  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late SharedPreferences _pref;
  static const String namePrefKey = 'name_pref';
  static const String passwordPrefKey = 'password_pref';


  bool _hidePass = true;
  final String _userName = '';
  final String _password = '';
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }



  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => _pref = prefs);
      _loadNamePref();
    });
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
          title: const Text('registration'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black54,
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Name *',
                      hintText: 'введите ваше имя',
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: Icon(Icons.delete),
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
                const SizedBox(height: 10),
                TextFormField(
                  //controller: ,
                  keyboardType: TextInputType.number,
                  obscureText: _hidePass,
                  maxLength: 5,
                  decoration: InputDecoration(
                      labelText: 'Password *',
                      hintText: 'введите пароль',
                      prefixIcon: const Icon(Icons.security),
                      suffixIcon: IconButton(
                        icon:  Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
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
                  //controller: ,
                  keyboardType: TextInputType.number,
                  obscureText: _hidePass,
                  maxLength: 5,
                  decoration: InputDecoration(
                      labelText: 'Password *',
                      hintText: 'введите пароль',
                      prefixIcon: const Icon(Icons.security),
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
                const Spacer(),
                HistoryButton(
                  text: 'REGISTRATION',
                  textSize: 20,
                  textColor: Colors.white,
                  callback: () async{
                    _addNamePref(_nameController.text);
                    _addPasswordPref;
                    //print('имя пользователя $_addNamePref');
                   // print('пароль пользователя $_addPasswordPref');
                   print('имя пользователя Controller ${_nameController.text}');
                    log('$_addNamePref');

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
        ),
      ),
    );
  }

  Future _addNamePref(String string) async {
    await _pref.setString(namePrefKey, string);
    _loadNamePref();
  }

  Future<Null> _addPasswordPref(String string) async {
    await _pref.setString(passwordPrefKey, string);

  }

  void _loadNamePref() {


  // void addPref () {
  //   _nameController.text;
  // }


}
