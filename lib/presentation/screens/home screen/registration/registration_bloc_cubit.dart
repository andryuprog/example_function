
import 'package:bloc/bloc.dart';
import 'registration_bloc_state.dart';
import '../../../domain/repositories/authorization_repository.dart';


class RegistrationBlocCubit extends Cubit<RegistrationBlocState> {
  RegistrationBlocCubit(this.authorizationRepository) : super(RegistrationBlocInitial());
  AuthorizationRepository authorizationRepository;

  void  save(String name, String password) {
    authorizationRepository.setNamePref(name);
    authorizationRepository.setPasswordPref(password);
    emit(const RegistrationBlocDataState());
  }

  void  addNamePreferences (value) {
  authorizationRepository.setNamePref(value);
  // emit(const RegistrationBlocDataState());
}

  void  addPasswordPreferences (value) {
    authorizationRepository.setPasswordPref(value);
    // emit(const RegistrationBlocDataState());
  }


     String? getNamePreferences() {
     var name = authorizationRepository.getNamePref();
     emit( RegistrationBlocDataState(name: name));
     return name;

  }

   String? getPasswordPreferences() {
     var password = authorizationRepository.getPasswordPref();
     emit( RegistrationBlocDataState(password: password));
     return password;
  }

   passwordComparison ([String? text = '', String? pass = '']){
    var password = authorizationRepository.getPasswordPref();
    var name = authorizationRepository.getNamePref();
    if (text == name && pass == password) {
      emit( RegistrationBlocDataState(name: text, password: pass));
      return true;
    }
  }

}

