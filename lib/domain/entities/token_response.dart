import 'package:equatable/equatable.dart';

class TokenResponse extends Equatable {
  const TokenResponse({
    required this.token,
    required this.refreshToken
  });

  final String token;
  final String refreshToken;

  @override
  List<Object?> get props => [token, refreshToken];
}