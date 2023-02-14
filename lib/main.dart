import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/screens/history/weather_screen.dart';
import 'api/weather_api.dart';
import 'screens/calc/calcBlockCubit.dart';
import 'screens/calc/home.dart';
import 'screens/history/history_block_cubit.dart';
import 'screens/history/history_repository.dart';
import 'screens/history/weather_block_cubit.dart';
import 'screens/history/weather_repository.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              '/': (context) => const CalculatorApp(),
              '/two_pages': (context) => const HistoryPage(),
            }),
      ),
    );
  }
}



