
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../authorization/authorization_screen.dart';
import '../registration/registration_screen.dart';
import 'home_bloc_cubit.dart';
import 'home_bloc_state.dart';
import 'dart:math';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<double> rotation;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 8000));
    rotation = Tween(begin: 0.0, end: 5* 2 * pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutSine),
    );
    controller.addListener(() {
      print('STATUS: ${controller.status}');
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();

      }else if(controller.status == AnimationStatus.dismissed) {
        controller.forward(); // если стоит reaped(), то этот участок кода ненужен
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    controller.forward();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('welcome'),
        centerTitle: true,
      ),
      body:
      AnimatedBuilder(
        animation: controller,
        builder: (context, child){
         // print(rotation.value);
          return Transform.rotate(
            angle: rotation.value,
            child: BlocListener<HomeBlocCubit, HomeBlocState>(
              listener: (context, state) {
                if (state is HomeBlocLoading){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const Authorization()));
                } else if (state is HomeBlocAddRegistration){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const Registration()));
                }
              },
              child: Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: CustomPaint(painter: _MyPainter()),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintRight = Paint();
    paintRight.color =Colors.white;
    paintRight.isAntiAlias = true;
    paintRight.style = PaintingStyle.stroke;
    paintRight.strokeWidth = 17;
    canvas.drawCircle(Offset(size.width /2, size.height / 2), 30, paintRight);

    canvas.drawArc(Offset.zero & size, 1.60, 1.42, false, paintRight);
    canvas.drawArc(Offset.zero & size, -0.05,-1.50, false, paintRight);
    canvas.drawArc(Offset.zero & size, 0.39/pi, pi/2-0.25, false, paintRight);
    canvas.drawArc(Offset.zero & size, pi+0.1,pi/2-0.23, false, paintRight);

    // final paintLeft = Paint();
    // paintLeft.color =Colors.white;
    // paintLeft.isAntiAlias = true;
    // paintLeft.style = PaintingStyle.stroke;
    // paintLeft.strokeWidth = 12;
    // canvas.drawCircle(Offset(size.width /2, size.height / 2), 30, paintLeft);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}



