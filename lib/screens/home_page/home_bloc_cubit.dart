
import 'package:bloc/bloc.dart';
import 'package:my_calculate/screens/home_page/home_bloc_state.dart';
import 'package:my_calculate/screens/home_page/home_repository.dart';


class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit(this.homeRepository) : super(HomeBlocInitial());
  HomeRepository homeRepository;


  void  addNamePreferences (value) {
  homeRepository.setNamePref(value);
  emit(const HomeBlocDataState());
}

  void  addPasswordPreferences (value) {
    homeRepository.setPasswordPref(value);
  }
     String? getNamePreferences() {
     var name = homeRepository.getNamePref();
     emit( HomeBlocDataState(name: name));
     return name;

  }

  //  getPasswordPreferences(String value) {
  //   if (homeRepository.getPasswordPref() == value) {
  //   }
  //   emit(const HomeBlocDataState());
  // }



}

