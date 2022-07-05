
import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';

class PostGenerateToken implements UseCase {
  PostGenerateToken({required this.repository});
  final AuthRepository repository;

  @override
  Future<Either<Failure, dynamic>> call(request) async {
    return await repository.generateToken(request);
  }
}