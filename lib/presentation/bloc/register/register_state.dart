import 'package:boilerplate/domain/entities/register_response.dart';
import 'package:equatable/equatable.dart';

enum RegisterStatus {
  initial,
  loading,
  verifyFailure,
  verifySuccess,
  registerFailure,
  registerSuccess
}

class RegisterState extends Equatable {
  const RegisterState({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.confirmPassword,
    this.otp,
    this.response,
    required this.status
  });

  final String? email;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? confirmPassword;
  final String? otp;
  final RegisterStatus status;
  final RegisterResponse? response;

  RegisterState copyWith({
    String? email,
    String? firstName,
    String? lastName,
    String? password,
    String? confirmPassword,
    String? otp,
    RegisterResponse? response,
    required RegisterStatus status
  }) {
    return RegisterState(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      otp: otp ?? this.otp,
      response: response ?? this.response,
      status: status
    );
  }

  @override
  List<Object?> get props => [email, firstName, lastName, password, confirmPassword, otp, status];
}