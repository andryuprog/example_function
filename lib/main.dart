import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/presentation/screens/calc/calc.dart';
import 'package:my_calculate/presentation/screens/calc/calcBlockCubit.dart';
import 'package:my_calculate/presentation/screens/history/history_block_cubit.dart';
import 'package:my_calculate/domain/repositories/history_repository.dart';
import 'package:my_calculate/presentation/screens/home%20screen/authorization/authorization_bloc_cubit.dart';
import 'package:my_calculate/presentation/screens/home%20screen/home/home_bloc_cubit.dart';
import 'package:my_calculate/presentation/screens/home%20screen/registration/registration_bloc_cubit.dart';
import 'package:my_calculate/domain/repositories/authorization_repository.dart';
import 'package:my_calculate/presentation/screens/home%20screen/registration/registration_screen.dart';
import 'package:my_calculate/presentation/screens/weather/weather_block_cubit.dart';
import 'package:my_calculate/domain/repositories/weather_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/api/weather_dio_api.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
  runApp(MyApp(sharedPreferences: sharedPreferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const MyApp({super.key, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => WeatherRepository(WeatherApi()),
        ),
        RepositoryProvider(
          create: (context) => HistoryRepository(),
        ),
        RepositoryProvider(
            create: (context) => AuthorizationRepository(sharedPreferences),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  WeatherBlocCubit(context.read<WeatherRepository>())),
          BlocProvider(
              create: (context) =>
              HistoryBlockCubit(context.read<HistoryRepository>())),
          BlocProvider(
              create: (context) =>
              CalcBlocCubit(context.read<HistoryRepository>())),
          BlocProvider(
            create: (context) =>
          RegistrationBlocCubit(context.read<AuthorizationRepository>())),
          BlocProvider(
              create: (context) =>
              HomeBlocCubit(context.read<AuthorizationRepository>())),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'my calculate',
            theme: ThemeData(
              colorScheme: const ColorScheme.dark(
                secondary: Colors.black87,
              ),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) =>  const Registration(),
              '/weather_screen': (context) => const CalculatorApp(),
            }),
      ),
    );
  }
}



