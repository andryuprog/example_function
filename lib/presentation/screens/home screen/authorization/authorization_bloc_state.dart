import 'package:equatable/equatable.dart';

abstract class AuthorizationState extends Equatable {
  const AuthorizationState();
}

class AuthorizationBlocInitial extends AuthorizationState {
  const AuthorizationBlocInitial();

  @override
  List<Object?> get props => [];
}

class AuthorizationBlocLoading extends AuthorizationState {
  const AuthorizationBlocLoading();

  @override
  List<Object?> get props => [];
}

class AuthorizationBlocLoaded extends AuthorizationState {
  const AuthorizationBlocLoaded(this.name, this.password);

  final String name;
  final String password;

  @override
  List<Object?> get props => [name, password];
}

class InitializeFieldState extends AuthorizationState {
  final String name;

  const InitializeFieldState(this.name);

  @override
  List<Object?> get props => [name];
}

class AuthorizationBlocConfirm extends AuthorizationState {
  const AuthorizationBlocConfirm();

  @override
  List<Object?> get props => [];
}

class AuthorizationBlocError extends AuthorizationState {
  const AuthorizationBlocError();

  @override
  List<Object?> get props => [];
}
