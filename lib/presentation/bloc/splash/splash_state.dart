import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState([this._props = const []]);

  final List<Object> _props;

  @override
  List<Object> get props => _props;
}

class SplashStateInit extends SplashState {}

class SplashStateLoading extends SplashState {}

class SplashStateLoaded extends SplashState {}

class SplashStateError extends SplashState {
  SplashStateError(this.error) : super([error]);

  final String error;
}

class SplashStateFetchTodoSuccess extends SplashState {
  SplashStateFetchTodoSuccess(this.dynamicList) : super([dynamicList]);

  final List<dynamic> dynamicList;
}
