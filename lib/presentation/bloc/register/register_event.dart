
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}
class A extends RegisterEvent {

}

class OnRegisterPressed extends RegisterEvent {
  const OnRegisterPressed(this.username, this.password);

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
