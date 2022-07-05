import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  const RegisterResponse({
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  final String email;
  final String firstName;
  final String lastName;

  @override
  List<Object?> get props => [email, firstName, lastName];
}