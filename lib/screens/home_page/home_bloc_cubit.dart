
import 'package:bloc/bloc.dart';
import 'package:my_calculate/screens/home_page/home_bloc_state.dart';
import 'package:my_calculate/screens/home_page/home_repository.dart';

class HomeBlocCubit extends Cubit<HomeBlocState>{
  HomeBlocCubit(this.homeRepository) : super(HomeBlocInitial());

  HomeRepository homeRepository;
  bool hidePass = true;


  void editorSee() {
    hidePass = !hidePass;
    emit(state);
  }
}

