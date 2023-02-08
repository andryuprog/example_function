import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_calculate/screens/history/weather_bloc_state.dart';
import 'package:my_calculate/screens/history/weather_repository.dart';
import '../../api/weather_api.dart';
import '../../model/history_db.dart';
import '../../widgets/temp_view.dart';
import 'history_block.dart';
import 'history_repository.dart';
import 'weather_block_cubit.dart';

class TwoPages extends StatelessWidget {
  TwoPages({Key? key}) : super(key: key);

  HistoryBlock historyDb = HistoryBlock(HistoryRepository())..getOperationList();
  WeatherBlocCubit weather = WeatherBlocCubit(WeatherRepository(WeatherApi()))..getWeatherObject();
  //late ErrorState error;

  Future initOperationsListDb() async {
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
                      BlocBuilder<WeatherBlocCubit, WeatherBlocState>(
                        bloc: weather,
                        //stream: weather.streamController.stream,
                        builder: (context, state) {
                          if (state is LoadingState) {
                            // if (state is ){
                            return const SpinKitSpinningLines(
                                color: Colors.white);
                          }
                          if (state is ErrorState) {
                            return Center(
                              child: Text(
                                state.error,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }
                          if (state is DataState) {
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
                                        children:  [
                                          //Text('text good  Yessss'),
                                          // CityView(snapshot: snapshot),
                                        TempView(
                                        state.data.objectWeather!.date,
                                          state.data.objectWeather!,
                                           ),
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
                      if (snapshot.data != null) {
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
                                  // historyDb.streamHistoryController.sink
                                  // .add(historyRepository.(operationList?[index].id));

                                  // initStateOperationsList();
                                },
                              ),
                              onTap: () {},
                            ),
                          ),
                        );
                      }
                      return Container();
                    }),
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
