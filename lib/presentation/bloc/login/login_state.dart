import 'package:boilerplate/domain/entities/token_response.dart';
import 'package:boilerplate/presentation/bloc/register/register_state.dart';
import 'package:equatable/equatable.dart';

enum LoginStatus { initail, loading, loginFailur, loginSuccess }

class LoginState extends Equatable {
  const LoginState({
    this.username,
    this.password,
    this.response,
    required this.status,
  });

  final String? username;
  final String? password;
  final LoginStatus status;
  final TokenResponse? response;

  LoginState copyWith({
    String? username,
    String? password,
    TokenResponse? response,
    required LoginStatus status,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        response: response ?? this.response,
        status: status);
  }

  @override
  List<Object?> get props => [username, password, status];
}
