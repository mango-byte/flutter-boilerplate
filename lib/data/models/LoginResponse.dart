import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
   const LoginResponse({
    this.username,
    this.token,
    this.refresh
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    username: json['username'] as String,
    token: json['token'] as String,
    refresh: json['weather'] as String
  );

  final String? username;
  final String? token;
  final String? refresh;

  @override
  List<Object> get props => [];
}