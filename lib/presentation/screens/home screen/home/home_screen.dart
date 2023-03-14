import 'package:colorful_progress_indicators/colorful_progress_indicators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_calculate/presentation/screens/home%20screen/home_bloc_cubit.dart';
import 'package:my_calculate/presentation/screens/home%20screen/home_bloc_state.dart';
import 'package:particles_flutter/component/painter.dart';
import 'package:particles_flutter/particles_flutter.dart';

import '../calc/calcBlockCubit.dart';

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
      body: BlocBuilder<HomeBlocCubit, HomeBlocState>(
        builder: (context, state) {

          return Column(
            children: [
              CircularParticle(
                awayRadius: 100 / 3,
                numberOfParticles: 350,
                speedOfParticles: 1,
                height: 700,
                width: 700,
                onTapAnimation: true,
                particleColor: Colors.white.withOpacity(.7),
                awayAnimationDuration: const Duration(milliseconds: 600),
                maxParticleSize: 5,
                isRandSize: true,
                isRandomColor: false,
                awayAnimationCurve: Curves.easeInOutBack,
                enableHover: true,
                hoverColor: Colors.white,
                hoverRadius: 70,
                connectDots: true,
              ),
              const Center(
                child: ColorfulLinearProgressIndicator(
                  colors: [
                    Colors.red,
                    Colors.blue,
                    Colors.purple,
                    Colors.orange,
                  ],
                  duration: Duration(milliseconds: 500),
                  initialColor: Colors.red,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
