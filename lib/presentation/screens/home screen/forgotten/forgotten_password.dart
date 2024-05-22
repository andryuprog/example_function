import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/presentation/screens/home%20screen/forgotten/forgotten_bloc_cubit.dart';
import 'package:my_calculate/presentation/screens/home%20screen/forgotten/forgotten_bloc_state.dart';

import '../../../../data/repositories/authorization_repository.dart';
import '../../../widgets/history_button.dart';
import '../authorization/authorization_screen.dart';
import '../registration/registration_screen.dart';

class Forgotten extends StatefulWidget {
  const Forgotten({Key? key}) : super(key: key);

  @override
  State<Forgotten> createState() => _ForgottenState();
}

class _ForgottenState extends State<Forgotten> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController repeatPasswordController =
      TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('password recovery'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black87,
      body: BlocBuilder<ForgottenBlocCubit, ForgottenState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^\d+$').hasMatch(value)) {
                        return 'неправильные символы';
                      } else {
                        return null;
                      }
                    },
                    controller: newPasswordController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: 'New password *',
                        hintText: 'введите новый пароль',
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
                  const SizedBox(height: 20),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^\d+$').hasMatch(value)) {
                        return 'неправильные символы';
                      } else {
                        return null;
                      }
                    },
                    controller: repeatPasswordController,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Repeat password *',
                        hintText: 'введите новый пароль',
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
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      context
                          .read<AuthorizationRepository>()
                          .deletePreferences();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Registration()));
                    },
                    child: const Text('удалиться из базы'),
                  ),
                  const Spacer(),
                  HistoryButton(
                    text: 'AUTHORIZATION',
                    textSize: 15,
                    textColor: Colors.white,
                    callback: () {
                      if (_formKey.currentState!.validate()) {
                        context
                            .read<ForgottenBlocCubit>()
                            .addEditPassword(newPasswordController.text);
                      } else {
                        const snackBar = SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('ошибка ввода данных'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const Authorization()));
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
