
import 'package:boilerplate/domain/entities/token_response.dart';
import 'package:boilerplate/domain/usecases/post_generate_token.dart';
import 'package:boilerplate/domain/usecases/post_refresh_token.dart';
import 'package:boilerplate/domain/usecases/post_register_user.dart';
import 'package:dartz/dartz.dart';
import 'package:boilerplate/data/datasources/auth_datasource.dart';
import 'package:boilerplate/data/exception.dart';
import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/entities/register_response.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({@required required this.dataSource});
  final AuthDataSource dataSource;

  @override
  Future<Either<ServerFailure, String>> verifyEmail(String email) async {
    try {
      final result = await dataSource.verifyEmail(email);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<ServerFailure, RegisterResponse>> register(
      RegisterRequest request) async {
    try {
      final result = await dataSource.register(request);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<ServerFailure, TokenResponse>> generateToken(
      TokenRequest request) async {
    final result =
        await dataSource.generateToken(request.email, request.password);
    return Right(result.toEntity());
  }

  @override
  Future<Either<ServerFailure, TokenResponse>> refreshToken(
      RefreshTokenRequest request) async {
       final result = await dataSource.refreshToken(request);
       return Right(result.toEntity());
  }
}
