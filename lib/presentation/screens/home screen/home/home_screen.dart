
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_bloc_cubit.dart';
import 'home_bloc_state.dart';
import 'dart:math';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('welcome'),
        centerTitle: true,
      ),
      body:
      BlocListener<HomeBlocCubit, HomeBlocState>(
        listener: (context, state) {
          // if (state is HomeBlocLoading) {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (BuildContext context) =>
          //           const Authorization()));
          // } else if (state is HomeBlocAddRegistration){
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (BuildContext context) =>
          //           const Registration()));
          // }
        },
        child: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: CustomPaint(painter: MyPainter()),
          ),
        ),
      ),
    );
  }
}
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color =Colors.white;
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 18;
    canvas.drawCircle(Offset(size.width /2, size.height / 2), 30, paint);

    canvas.drawArc(Offset.zero & size, 1.58, 1.52, false, paint);
    canvas.drawArc(Offset.zero & size, -0.0,-1.58, false, paint);

    // canvas.drawArc(Offset.zero & size, -1.50, -1.50, false, paint);
    // canvas.drawArc(Offset.zero & size, 0.0,1.58, false, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

