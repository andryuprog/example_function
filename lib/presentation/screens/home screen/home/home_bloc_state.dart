
import 'package:equatable/equatable.dart';

abstract class HomeBlocState extends Equatable {
  const HomeBlocState();
}

class HomeBlocInitial extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

class HomeBlocLoading extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

class HomeBlocData extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

class HomeBlocError extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

