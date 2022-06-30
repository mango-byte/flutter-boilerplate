import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent([this._props = const []]);

  final List<Object> _props;

  @override
  List<Object> get props => _props;
}

class SplashEventFetchTodo extends SplashEvent {}
