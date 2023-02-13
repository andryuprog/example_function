// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:is_figure/screen/calc/calc_bloc_cubit.dart';
// import 'package:is_figure/screen/historyweather/history_bloc_cubit.dart';
// import 'package:is_figure/screen/historyweather/weather_bloc_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:is_figure/domain/history_repository.dart';
// import 'package:is_figure/domain/weather_repository.dart';
// import 'package:sqflite/sqflite.dart';
// import 'api/weather_api.dart';
// import 'dataBase/data_base.dart';
// import 'screen/calc/calc_screen.dart';
// import 'screen/historyweather/history_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Database db = await DBProvaider.db.database;
//   runApp(MyApp(db: db));
// }
//
// class MyApp extends StatefulWidget {
//   final Database db;
//
//   const MyApp({super.key, required this.db});
//
//   @override
//   State<MyApp> createState() => MyAppState();
// }
//
// class MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider(
//           create: (context) => HistoryRepository(widget.db),
//         ),
//         RepositoryProvider(
//           create: (context) => WeatherRepository(WeatherApi()),
//         ),
//       ],
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//               create: (context) =>
//                   CalcBlocCubit(context.read<HistoryRepository>())),
//           BlocProvider(
//               create: (context) =>
//                   HistoryBlocCubit(context.read<HistoryRepository>())),
//           BlocProvider(
//               create: (context) =>
//                   WeatherBlocCubit(context.read<WeatherRepository>())),
//         ],
//         child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           initialRoute: '/',
//           routes: {
//             '/': (context) => const CalculatorScreen(),
//             '/history_page': (context) => const HistoryPage(),
//           },
//         ),
//       ),
//     );
//   }
// }
