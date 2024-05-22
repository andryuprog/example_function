import 'package:equatable/equatable.dart';

abstract class RegistrationBlocState extends Equatable {
  const RegistrationBlocState();
}

class RegistrationBlocInitial extends RegistrationBlocState {
  @override
  List<Object?> get props => [];
}

class RegistrationBlocLoad extends RegistrationBlocState {
  @override
  List<Object?> get props => [];
}

class RegistrationBlocDataState extends RegistrationBlocState {
  final String? password;
  final String? name;

  const RegistrationBlocDataState({this.password, this.name});

  @override
  List<Object?> get props => [password, name];
}

class EditorSee extends RegistrationBlocState {
  final bool hidePass;

  const EditorSee({this.hidePass = false});

  @override
  List<Object?> get props => [hidePass];
}
