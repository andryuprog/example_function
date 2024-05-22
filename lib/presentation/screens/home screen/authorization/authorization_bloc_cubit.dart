
import 'package:bloc/bloc.dart';
import 'package:my_calculate/presentation/screens/home%20screen/authorization/authorization_bloc_state.dart';
import '../../../../data/repositories/authorization_repository.dart';


class AuthorizationBlocCubit extends Cubit<AuthorizationState> {
  String? name;
  String? pass;
  AuthorizationBlocCubit(this.authorizationRepository)
      : super( const AuthorizationBlocInitial());
  AuthorizationRepository authorizationRepository;


  init() async {
    name = authorizationRepository.getNamePref();
    pass = authorizationRepository.getPasswordPref();
    await Future.delayed(const Duration(seconds: 1));
                                           // log("init__$name, $pass");
    if(name != null && pass != null) {
      emit(InitializeFieldState(name!));
    }
  }

  void checkFields(String nameField, String passwordField) {

    if (nameField == name && passwordField == pass){
      emit(const AuthorizationBlocConfirm());
    }else{
      emit(const AuthorizationBlocError());
    }
    }
}