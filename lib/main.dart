import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_calculate/data/utilities/constants.dart';
import 'package:my_calculate/presentation/screens/calc/calc.dart';
import 'package:my_calculate/presentation/screens/calc/calcBlockCubit.dart';
import 'package:my_calculate/presentation/screens/history/history_block_cubit.dart';
import 'package:my_calculate/presentation/screens/home%20screen/forgotten/forgotten_bloc_cubit.dart';
import 'package:my_calculate/presentation/screens/home%20screen/home/home_bloc_cubit.dart';
import 'package:my_calculate/presentation/screens/home%20screen/home/home_screen.dart';
import 'package:my_calculate/presentation/screens/home%20screen/registration/registration_bloc_cubit.dart';
import 'package:my_calculate/presentation/screens/weather/weather_block_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/api/weather_dio_api.dart';
import 'data/repositories/authorization_repository.dart';
import 'data/repositories/history_repository.dart';
import 'data/repositories/weather_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await dotenv.load(fileName: ".env");
  Constants.loadEnv();
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
              create: (context) => RegistrationBlocCubit(
                  context.read<AuthorizationRepository>())),
          BlocProvider(
              create: (context) =>
                  HomeBlocCubit(context.read<AuthorizationRepository>())
                    ..initial()),
          BlocProvider(
            create: (context) =>
                ForgottenBlocCubit(context.read<AuthorizationRepository>()),
          ),
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
              '/': (context) => const HomeScreen(),
              '/weather_screen': (context) => const CalculatorApp(),
            }),
      ),
    );
  }
}
