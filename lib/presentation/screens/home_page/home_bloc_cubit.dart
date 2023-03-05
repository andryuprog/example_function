
import 'package:bloc/bloc.dart';
import 'home_bloc_state.dart';
import 'home_repository.dart';


class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit(this.homeRepository) : super(HomeBlocInitial());
  HomeRepository homeRepository;


  void  addNamePreferences (value) {
  homeRepository.setNamePref(value);
  emit(const HomeBlocDataState());
}

  void  addPasswordPreferences (value) {
    homeRepository.setPasswordPref(value);
    emit(const HomeBlocDataState());
  }


     String? getNamePreferences() {
     var name = homeRepository.getNamePref();
     emit( HomeBlocDataState(name: name));
     return name;

  }

   String? getPasswordPreferences() {
     var password = homeRepository.getPasswordPref();
     emit( HomeBlocDataState(password: password));
     return password;
  }

   passwordComparison ([String? text = '', String? pass = '']){
    var password = homeRepository.getPasswordPref();
    var name = homeRepository.getNamePref();
    if (text == name && pass == password) {
      return true;
    }
  }

}

