import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed({
    @required required this.username,
    @required required this.password
  });

  final String? username;
  final String? password;

  @override
  List<Object> get props => [username!, password!];
}