import 'package:dartz/dartz.dart';
import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/entities/register_response.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';

class PostRegisterUser {
  PostRegisterUser({required this.repository});
  final AuthRepository repository;

  Future<Either<Failure, RegisterResponse>> perform(
      String username, String password) => repository.register(username, password);
}