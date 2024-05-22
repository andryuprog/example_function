import 'package:bloc/bloc.dart';

import '../../../../data/repositories/authorization_repository.dart';
import 'forgotten_bloc_state.dart';

class ForgottenBlocCubit extends Cubit<ForgottenState> {
  ForgottenBlocCubit(this.authorizationRepository)
      : super(const ForgottenInitialState());

  AuthorizationRepository authorizationRepository;


  void  addEditPassword(String password) {
    authorizationRepository.setPasswordPref(password);
    emit(const ForgottenLoadedState());
  }

}
