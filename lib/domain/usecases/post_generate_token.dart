import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PostGenerateToken implements UseCase {
  PostGenerateToken({required this.repository});
  final AuthRepository repository;

  @override
  Future<Either<Failure, dynamic>> call(request) async {
    return await repository.generateToken(request);
  }
}

class TokenRequest extends Equatable {
  const TokenRequest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'username': email,
        'password': password,
      };
  final String email;
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
