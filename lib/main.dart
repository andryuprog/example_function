import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/screens/home_page/authorization.dart';
import 'package:my_calculate/screens/home_page/home_bloc_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/weather_dio_api.dart';
import 'screens/calc/calcBlockCubit.dart';
import 'screens/calc/calc.dart';
import 'screens/history/history_block_cubit.dart';
import 'screens/history/history_repository.dart';
import 'screens/history/weather_block_cubit.dart';
import 'screens/history/weather_repository.dart';
import 'screens/home_page/home_repository.dart';
import 'screens/home_page/registration.dart';


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
            create: (context) => HomeRepository(sharedPreferences),
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
              CalcBlockCubit(context.read<HistoryRepository>())),
          BlocProvider(
            create: (context) =>
          HomeBlocCubit(context.read<HomeRepository>())),
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



