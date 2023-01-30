import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_calculate/api/weather_api.dart';
import 'package:my_calculate/screens/history/weather_wrapper.dart';
import '../../widgets/temp_view.dart';
import 'history_block.dart';
import 'history_repository.dart';
import 'weather_block.dart';
import 'weather_repository.dart';

class TwoPages extends StatefulWidget {
  const TwoPages({Key? key}) : super(key: key);

  @override
  State<TwoPages> createState() => TwoPagesState();
}

class TwoPagesState extends State<TwoPages> {


   HistoryBlock historyDb = HistoryBlock(HistoryRepository());
  late WeatherBlockH weather;

  @override
  void initState() {
    super.initState();
    weather = WeatherBlockH(WeatherRepository(WeatherApi()))
      ..getWeatherObject();
    historyDb = HistoryBlock(HistoryRepository())..getOperationList();
    initStateOperationsList();
  }

  Future initStateOperationsList() async {
    historyDb.operationList = await historyDb.getOperationList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('database & weather'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black54,
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 30,
                  child: ListView(
                    children: [
                      StreamBuilder<WeatherWrapper>(
                        stream: weather.streamController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isProgress) {
                              return const SpinKitSpinningLines(
                                  color: Colors.white);
                            }
                            if (snapshot.data!.error != null) {
                              return Center(
                                child: Text(
                                  snapshot.data!.error!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            }
                            return Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        //mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TempView(
                                              snapshot
                                                  .data!.objectWeather!.date,
                                              snapshot.data!.objectWeather!),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return const Center(
                              child: SpinKitSpinningLines(
                                  color: Colors.white, size: 40.0),
                            );
                          }
                        },
                      ),
                    ],
                  )),
              Expanded(
                flex: 70,
                child: StreamBuilder(
                    stream: historyDb.streamHistoryController.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // if (snapshot.data!.isProgress) {
                        //   return const SpinKitSpinningLines(color: Colors.white);
                        // }
                        // if (snapshot.data!.error != null) {
                        //   return Center(
                        //     child: Text(
                        //       snapshot.data!.error!,
                        //       style: const TextStyle(
                        //         fontSize: 20,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   );
                        // }
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.all(20.0),
                        itemCount: historyDb.operationList.length,
                        itemBuilder: (context, index) => Card(
                          color:
                              getChangeColor(historyDb.operationList[index].operation),
                          elevation: 20,
                          shadowColor: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(
                              "${historyDb.operationList[index].time}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              "${historyDb.operationList[index].operation}",
                            ),
                            leading: const Icon(
                              Icons.access_alarm_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, size: 40),
                              onPressed: () {
                                historyDb.dell(historyDb.operationList[index].id);
                                 initStateOperationsList();
                                setState(() {});
                              },
                            ),
                            onTap: () {},
                          ),
                        ),
                      );
                    }
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static getChangeColor(operation) {
    if (operation != null) {
      if (operation.contains('-')) {
        return const Color(0xFFB71C1C);
      }
      if (operation.contains('+')) {
        return const Color(0xFF2A850E);
      }
      if (operation.contains('/')) {
        return const Color(0xFF1B0DAC);
      }
      if (operation.contains('*')) {
        return const Color(0xFFEEF905);
      }
    }
  }
}
