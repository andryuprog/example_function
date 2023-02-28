
import 'package:bloc/bloc.dart';
import 'package:my_calculate/screens/home_page/home_bloc_state.dart';
import 'package:my_calculate/screens/home_page/home_repository.dart';


class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit(this.homeRepository) : super(HomeBlocInitial());
  HomeRepository homeRepository;

  void  addNamePreferences (value) {
  homeRepository.setNamePref(value);
  emit(HomeBlocData());
}
  void  addPasswordPreferences (value) {
    homeRepository.setPasswordPref(value);
    emit(HomeBlocData());
  }
    void getNamePreferences(value) {
     homeRepository.getNamePref();
     emit(HomeBlocData());
  }

  void getPasswordPreferences(value) {
    homeRepository.getPasswordPref();
    emit(HomeBlocData());
  }
}

