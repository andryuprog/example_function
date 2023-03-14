import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../calc/calc.dart';
import '../../widgets/history_button.dart';
import 'registration_bloc_cubit.dart';
import 'registration_bloc_state.dart';

class Authorization extends StatefulWidget {
  const Authorization({Key? key}) : super(key: key);

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    passwordConfirmController.dispose();
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
        body: BlocBuilder<RegistrationBlocCubit, RegistrationBlocState>(
            builder: (context, state) {
          if (state is RegistrationBlocDataState) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    TextFormField(
                      initialValue: context
                          .read<RegistrationBlocCubit>()
                          .getNamePreferences(),
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
                    const SizedBox(height: 20),
                    TextFormField(
                      //initialValue: context.read<HomeBlocCubit>().getPasswordPreferences(),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'неправильные символы';
                        } else {
                          // else if (context.read<HomeBlocCubit>().passwordComparison()) {
                          //   return null;

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
                      onPressed: () {},
                      child: const Text('Забыли пароль?'),
                    ),
                    HistoryButton(
                      text: 'AUTHORIZATION',
                      textSize: 15,
                      textColor: Colors.white,
                      callback: () {
                        if (_formKey.currentState!.validate() &&
                              //  passwordConfirmController.text ==
                                    context
                                        .read<RegistrationBlocCubit>()
                                        .passwordComparison()
                            //&& context.read<HomeBlocCubit>().passwordComparison()

                            ) {
                          const snackBar = SnackBar(
                              content: Text('приветствуем в вашем аккаунте'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const CalculatorApp()));
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
              ),
            );
          }
          return const Text('');
        }),
      ),
    );
  }
}
