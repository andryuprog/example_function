import 'package:flutter/material.dart';
import '../screens/history/weather_model.dart';


// ignore: must_be_immutable
class TempView extends StatelessWidget {

  String date;
  WeatherModel model;

   TempView( this.date, this.model, {super.key});



  @override
  Widget build(BuildContext context) {


    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(model.icon, scale: 0.6),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: <Widget>[
            Text(
              '${model.temp}°C',
              style: const TextStyle(
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 30.0),
            Text(
              date,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          children: <Widget>[
            Text(
              '${model.city}, ${model.country}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
