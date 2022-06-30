import 'package:dartz/dartz.dart';
import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/entities/register_response.dart';

enum LoginFailure {
  invalidCredential,
  error
}

abstract class AuthRepository {
  Future<Either<ServerFailure, RegisterResponse>> register(String username, String password);
}
