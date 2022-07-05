
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class OnEmailChanged extends RegisterEvent {
  const OnEmailChanged({required this.email});
  final String email;
  @override
  List<Object?> get props => [email];
}

class OnVerifyEmailPressed extends RegisterEvent {
  const OnVerifyEmailPressed({
    required this.email
  });
  final String email;
}
class OnRegisterPressed extends RegisterEvent {
  const OnRegisterPressed({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.confirmPassword,
    required this.otp
  });
  final String firstName;
  final String lastName;
  final String password;
  final String confirmPassword;
  final String otp;
}
