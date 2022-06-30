import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rxdart/rxdart.dart';
import 'package:boilerplate/domain/usecases/post_register_user.dart';
import 'package:boilerplate/presentation/bloc/register/register.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._postRegisterUser) : super(RegisterInitial()) {
   on<OnRegisterPressed>((event, emit) async {
     emit(RegisterLoading());
     final result = await _postRegisterUser.perform(event.username, event.password);
     result.fold(
         (failure) => emit(RegisterError(failure.message)),
         (data) => emit(RegisterSuccess(data))
     );
   }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  final PostRegisterUser _postRegisterUser;
}