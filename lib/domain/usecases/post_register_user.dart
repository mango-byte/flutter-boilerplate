import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class PostRegisterUser implements UseCase {
  PostRegisterUser({required this.repository});
  final AuthRepository repository;

  @override
  Future<Either<Failure, dynamic>> call(request) async {
    return await repository.register(request);
  }
}

class RegisterRequest extends Equatable {
  const RegisterRequest({
    @required required this.firstName,
    @required required this.lastName,
    @required required this.email,
    @required required this.password,
    @required required this.code
  });

  Map<String, dynamic> toJson() => {
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'code': code
  };

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String code;

  @override
  List<Object?> get props => [firstName, lastName, email, password, code];
}