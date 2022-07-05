
// import 'package:boilerplate/data/datasources/auth_datasource.dart';
// import 'package:boilerplate/data/dio/dio_service.dart';
// import 'package:boilerplate/data/repositories/AuthRepositoryImpl.dart';
// import 'package:boilerplate/domain/repositories/AuthRepository.dart';
// import 'package:boilerplate/domain/usecases/post_generate_token.dart';
// import 'package:boilerplate/domain/usecases/post_register_user.dart';
// import 'package:boilerplate/domain/usecases/post_verify_email.dart';
// import 'package:boilerplate/domain/usecases/use_case.dart';
// import 'package:boilerplate/presentation/bloc/register/register.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';

// GetIt sl = GetIt.instance;

void setup() {
  // setRegisterSL();
}

void setRegisterSL() {
  // sl.registerLazySingleton<RestService>(() => RestService());
  // sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl(service: sl()));
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dataSource: sl()));
  // sl.registerLazySingleton<UseCase>(() => PostVerifyEmail(repository: sl()));
  // final _ = {
  //   'postVerifyEmail' : PostVerifyEmail(repository: sl()),
  //   'postRegisterUser' : PostRegisterUser(repository: sl()),
  //   'postGenerateToken' : PostGenerateToken(repository: sl()),
  // }.forEach((key, value) {
  //   sl.registerLazySingleton<UseCase>(() => value, instanceName: key);
  // });
  // sl.registerFactory<Bloc>(() => RegisterBloc(useCase: sl()));
}
