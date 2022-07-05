
import 'package:boilerplate/domain/entities/token_response.dart';
import 'package:equatable/equatable.dart';

class TokenModel extends Equatable {
  TokenModel({
    required this.id,
    required this.token,
    required this.refreshToken,
    required this.createdAt
  });

  factory TokenModel.fromJson(dynamic json) => TokenModel(
      id: json['id'] as int,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      createdAt: json['createdAt'] as String,
  );

  TokenResponse toEntity() => TokenResponse(
      token: token,
      refreshToken: refreshToken
  );

  int id;
  String token;
  String refreshToken;
  String createdAt;

  @override
  List<Object?> get props => [];
}
