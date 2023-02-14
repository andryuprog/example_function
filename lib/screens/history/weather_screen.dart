import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_calculate/screens/history/weather_bloc_state.dart';
import '../../widgets/temp_view.dart';
import 'history_bloc_state.dart';
import 'history_block_cubit.dart';
import 'weather_block_cubit.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);



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
              Flexible(


                  flex: 30,
                  fit: FlexFit.loose,

                  child: ListView(
                    children: [
                      BlocBuilder<WeatherBlocCubit, WeatherBlocState>(
                        //bloc: weather,
                        //stream: weather.streamController.stream,
                        builder: (context, state) {
                          if (state is LoadingState) {
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
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,

                                        children:  [
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
                child:BlocBuilder<HistoryBlockCubit, HistoryBlockState>(
                    builder: (context, state) {
                      if (state is HistoryBlocLoading) {
                         const SpinKitSpinningLines(color: Colors.white, size: 40.0);}
                      if (state is HistoryBlocDataBase) {
                        return ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          itemCount: state.dataBaseList.length,
                          itemBuilder: (context, index) => Card(
                            color:
                                getChangeColor(state.dataBaseList[index].operation),
                            elevation: 20,
                            shadowColor: getChangeColor(state.dataBaseList[index].operation),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(
                                "${state.dataBaseList[index].time}",
                                style: const TextStyle(fontSize: 16),
                              ),
                              subtitle: Text(
                                "${state.dataBaseList[index].operation}",
                              ),
                              leading: const Icon(
                                Icons.access_alarm_outlined,
                                size: 36,
                                color: Colors.white,
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, size: 36),
                                onPressed: () {
                                  context.read<HistoryBlockCubit>().dell(state.dataBaseList[index].id);
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
        return const Color(0xFFF38905);
      }
    }
  }
}
