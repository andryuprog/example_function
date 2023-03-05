
import 'package:equatable/equatable.dart';

abstract class HomeBlocState extends Equatable {
  final bool ishuemae = false;
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

class HomeBlocDataState extends HomeBlocState {
  final String? password;
  final String? name;
   const HomeBlocDataState({this.password, this.name});

  @override
  List<Object?> get props => [password,name];
}

class EditorSee extends HomeBlocState {
   final bool hidePass;
   const EditorSee({this.hidePass = false});
  @override
  List<Object?> get props => [hidePass];

}