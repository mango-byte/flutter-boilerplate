
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}
class HomeLoadingState extends HomeState {}
class HomeErrorState extends HomeState {}
class HomeSuccessState extends HomeState {

  @override
  List<Object?> get props => [];
}
