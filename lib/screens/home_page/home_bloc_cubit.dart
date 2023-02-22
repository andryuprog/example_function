
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_calculate/screens/home_page/home_bloc_state.dart';
import 'package:my_calculate/screens/home_page/home_repository.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit(this.homeRepository) : super(HomeBlocInitial());
  HomeRepository homeRepository;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();

}
  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _passwordController.dispose();
  //   _passwordController2.dispose(); // вырезано из StatefullWidget
  //   super.dispose();
  // }

