import 'package:boilerplate/data/failure.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PostRefreshToken implements UseCase {
  PostRefreshToken({required this.repository});
  final AuthRepository repository;

  @override
  Future<Either<Failure, dynamic>> call(request) async {
    return await repository.refreshToken(request);
  }
}

class RefreshTokenRequest extends Equatable {
  const RefreshTokenRequest({
    required this.email,
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'refreshToken': refreshToken,
      };
  final String email;
  final String refreshToken;

  @override
  List<Object?> get props => [
        email,
        refreshToken,
      ];
}
