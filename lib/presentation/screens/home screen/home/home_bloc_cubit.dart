
import 'package:bloc/bloc.dart';
import '../../../../domain/repositories/authorization_repository.dart';
import 'home_bloc_state.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {
  String? nameAuthorization;
  String? passAuthorization;


  HomeBlocCubit(this.authorizationRepository) : super(HomeBlocInitial());
  AuthorizationRepository authorizationRepository;

  initial() async {
    nameAuthorization = authorizationRepository.getNamePref();
    passAuthorization = authorizationRepository.getPasswordPref();
    await Future.delayed(const Duration(seconds: 1));
                                                                 // log("init__$name, $pass");
    if(nameAuthorization != null && passAuthorization != null) {
      emit(HomeBlocLoading());
    }else {
      emit(HomeBlocAddRegistration());
    }
  }


  void examination(String nameExamination, String passwordExamination) {

    if (nameExamination == nameAuthorization && passwordExamination == passAuthorization){
      emit(HomeBlocAddRegistration());
    }else{
      emit(HomeBlocError());
    }
  }

}
