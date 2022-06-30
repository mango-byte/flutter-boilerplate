import 'package:equatable/equatable.dart';
import 'package:boilerplate/domain/entities/register_response.dart';

class RegisterModel extends Equatable {
  const RegisterModel({
    required this.username,
    required this.accessToken,
    required this.refreshToken
  });

  factory RegisterModel.fromJson(dynamic json) => RegisterModel(
      username: json['username'] as String,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String
  );

  RegisterResponse toEntity() => RegisterResponse(
      username: username, 
      accessToken: accessToken, 
      refreshToken: refreshToken
  );

  final String username;
  final String accessToken;
  final String refreshToken;

  @override
  List<Object> get props => [];
}