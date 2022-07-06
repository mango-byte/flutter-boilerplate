import 'dart:developer';
import 'package:boilerplate/config/util/shared_pref_util.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/post_generate_token.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boilerplate/presentation/bloc/login/login_event.dart';
import 'package:boilerplate/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.repository})
      : super(const LoginState(status: LoginStatus.initail)) {
    _posttoken = PostGenerateToken(repository: repository);

    on<LoginButtonPressed>((event, emit) async {
      emit(state.copyWith(status: LoginStatus.loading));

      final result = await _posttoken
          .call(TokenRequest(email: event.username, password: event.password));

      result.fold(
          (failure) => emit(state.copyWith(status: LoginStatus.loginFailur)),
          (data) async {
            SharedPrefUtil.setValue(PrefType.STRING, PrefKey.token, data.token);
            SharedPrefUtil.setValue(PrefType.STRING, PrefKey.refreshToken, data.refreshToken);
            emit(state.copyWith(status: LoginStatus.loginSuccess));
         }
      );
    });
  }
  late UseCase _posttoken;
  final AuthRepository repository;
  void _addToValue() {}
}
