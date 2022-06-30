import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  const RegisterResponse({
    required this.username,
    required this.accessToken,
    required this.refreshToken,
  });

  final String username;
  final String accessToken;
  final String refreshToken;

  @override
  List<Object?> get props => [username, accessToken, refreshToken];
}