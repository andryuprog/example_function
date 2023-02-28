
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
   String? password;
   String? name;
  @override
  List<Object?> get props => [password,name];
}

class EditorSee extends HomeBlocState {
   bool hidePass = false;
   EditorSee(this.hidePass);
  @override
  List<Object?> get props => [hidePass];

}