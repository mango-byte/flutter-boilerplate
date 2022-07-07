
import 'dart:developer';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/post_register_user.dart';
import 'package:boilerplate/domain/usecases/post_verify_email.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:boilerplate/presentation/bloc/register/register.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required this.repository}) : super(const RegisterState(status: RegisterStatus.initial)) {
    _postVerifyEmail = PostVerifyEmail(repository: repository);
    _postRegisterUser = PostRegisterUser(repository: repository);

    on<OnEmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, status: state.status));
    }, transformer: debounce(const Duration(microseconds: 500)));

    on<OnVerifyEmailPressed>((event, emit) async {
      emit(state.copyWith(status: RegisterStatus.loading));
      final result = await _postVerifyEmail.call(event.email);
      result.fold(
        (failure) => emit(state.copyWith(status: RegisterStatus.verifyFailure)),
        (data) => emit(state.copyWith(
            status: RegisterStatus.verifySuccess,
            email: event.email,
            otp: data
        ))
      );
    }, transformer: debounce(const Duration(microseconds: 500)));
    on<OnRegisterPressed>((event, emit) async {
      emit(state.copyWith(status: RegisterStatus.loading));
      final result = await _postRegisterUser.call(RegisterRequest(
          firstName: event.firstName,
          lastName: event.lastName,
          email: state.email!,
          password: event.password,
          code: event.otp
      ));
      result.fold(
         (failure) => emit(state.copyWith(status: RegisterStatus.registerFailure)),
         (data) => emit(state.copyWith(status: RegisterStatus.registerSuccess, response: data))
     );
     }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  late UseCase _postVerifyEmail;
  late UseCase _postRegisterUser;
  final AuthRepository repository;
}