
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
  const AuthorizationBlocLoaded(this.name, this.password, this.namePref);
  final String name;
  final String password;
  final String namePref;

  @override
  List<Object?> get props => [name,password,namePref];
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

