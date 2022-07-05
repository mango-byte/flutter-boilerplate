import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:dartz/dartz.dart';

class PostVerifyEmail implements UseCase {
  PostVerifyEmail({required this.repository});
  final AuthRepository repository;

  @override
  Future<Either<Failure, dynamic>> call(email) async {
    return await repository.verifyEmail(email);
  }
}
