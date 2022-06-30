
import 'package:dartz/dartz.dart';
import 'package:boilerplate/data/datasources/auth_datasource.dart';
import 'package:boilerplate/data/exception.dart';
import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/entities/register_response.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.dataSource});
  final AuthDataSource dataSource;

  @override
  Future<Either<ServerFailure, RegisterResponse>> register(String username,
      String password) async {
    try {
      final result = await dataSource.register(username, password);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    }
  }
}