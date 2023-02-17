
import 'package:equatable/equatable.dart';

abstract class HomeBlocState extends Equatable {
  const HomeBlocState();
}

class HomeBlocInitial extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

class HomeBlocLoad extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

class HomeBlocData extends HomeBlocState {
  @override
  List<Object?> get props => [];
}

class EditorSee extends HomeBlocState {
  // bool hidePass;
  // EditorSee(this.hidePass);
  @override
  List<Object?> get props => [];

}