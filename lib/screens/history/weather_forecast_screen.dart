
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_calculate/screens/history/weather_repository.dart';
import 'package:my_calculate/screens/history/weather_wrapper.dart';
import '../../api/weather_api.dart';
import '../../model/history_db.dart';
import '../../widgets/temp_view.dart';
import 'history_block.dart';
import 'history_repository.dart';
import 'weather_block.dart';

class TwoPages extends StatelessWidget {
 TwoPages({Key? key}) : super(key: key);

 HistoryBlock historyDb = HistoryBlock(HistoryRepository())..getOperationList();
 WeatherBlockH weather = WeatherBlockH(WeatherRepository(WeatherApi()))..getWeatherObject();

 Future initStateOperationsList() async {
   historyDb.operationList = await historyDb.getOperationList();
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
                child: StreamBuilder<List<HistoryDb>>(
                    stream: historyDb.streamHistoryController.stream,
                    builder: (context, snapshot) {
                     List<HistoryDb>? operationList = snapshot.data;
                      return ListView.builder(
                        padding: const EdgeInsets.all(20.0),
                        itemCount: operationList?.length,
                        itemBuilder: (context, index) => Card(
                          color:
                              getChangeColor(operationList?[index].operation),
                          elevation: 20,
                          shadowColor: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            title: Text(
                              "${operationList?[index].time}",
                              style: const TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              "${operationList?[index].operation}",
                            ),
                            leading: const Icon(
                              Icons.access_alarm_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, size: 40),
                              onPressed: () {
                                historyDb.dell(operationList?[index].id);

                                // initStateOperationsList();
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
