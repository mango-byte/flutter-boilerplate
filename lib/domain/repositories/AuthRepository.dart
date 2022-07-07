import 'package:boilerplate/domain/entities/token_response.dart';
import 'package:boilerplate/domain/usecases/post_generate_token.dart';
import 'package:boilerplate/domain/usecases/post_refresh_token.dart';
import 'package:boilerplate/domain/usecases/post_register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/entities/register_response.dart';

abstract class AuthRepository {
  Future<Either<ServerFailure, RegisterResponse>> register(RegisterRequest request);
  Future<Either<ServerFailure, String>> verifyEmail(String email);
  Future<Either<ServerFailure, TokenResponse>> generateToken(TokenRequest request);
  Future<Either<ServerFailure, TokenResponse>> refreshToken(RefreshTokenRequest request);
  
}
