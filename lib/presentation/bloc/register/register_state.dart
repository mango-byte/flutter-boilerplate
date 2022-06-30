import 'package:equatable/equatable.dart';
import 'package:boilerplate/domain/entities/register_response.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterError extends RegisterState {
  const RegisterError(this.message );
  final String message;

  @override
  List<Object?> get props => [message];
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess(this.response );
  final RegisterResponse response;

  @override
  List<Object?> get props => [response];
}