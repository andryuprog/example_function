import 'package:equatable/equatable.dart';

abstract class ForgottenState extends Equatable {
  const ForgottenState();
}

class ForgottenInitialState extends ForgottenState {
  const ForgottenInitialState();

  @override
  List<Object?> get props => [];
}

class ForgottenLoadedState extends ForgottenState {
  const ForgottenLoadedState();

  @override
  List<Object?> get props => [];
}
