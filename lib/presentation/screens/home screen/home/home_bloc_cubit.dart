
import 'package:bloc/bloc.dart';
import 'package:my_calculate/presentation/screens/home%20screen/home_bloc_state.dart';
import '../../../domain/repositories/authorization_repository.dart';

class HomeBlocCubit extends Cubit<HomeBlocState> {
  HomeBlocCubit(this.authorizationRepository) : super(HomeBlocInitial());
  AuthorizationRepository authorizationRepository;



}
