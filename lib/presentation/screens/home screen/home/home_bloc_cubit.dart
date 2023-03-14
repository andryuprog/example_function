
import 'package:bloc/bloc.dart';
import '../../../../domain/repositories/authorization_repository.dart';
import 'home_bloc_state.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit(this.authorizationRepository) : super(HomeBlocInitial());
  AuthorizationRepository authorizationRepository;



}
