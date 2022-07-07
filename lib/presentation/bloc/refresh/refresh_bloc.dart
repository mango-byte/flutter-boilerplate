
import 'package:boilerplate/config/util/shared_pref_util.dart';
import 'package:boilerplate/domain/repositories/AuthRepository.dart';
import 'package:boilerplate/domain/usecases/post_refresh_token.dart';
import 'package:boilerplate/domain/usecases/use_case.dart';
import 'package:boilerplate/presentation/bloc/refresh/refresh_event.dart';
import 'package:boilerplate/presentation/bloc/refresh/refresh_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefreshBloc extends Bloc<RefreshEvent, RefreshState>{

  RefreshBloc({required this.repository}): super(const RefreshState(status: RefreshStatus.initail)){

    _postRefreshToken = PostRefreshToken(repository: repository);
    
   on<RefreshButtonPressed>((event, emit) async{
     emit(state.copyWith(status: RefreshStatus.loading));
     final result = await _postRefreshToken
          .call(RefreshTokenRequest(email: event.email, refreshToken: event.refreshToken));
          result.fold(
            (failure) => emit(state.copyWith(status: RefreshStatus.refreshFailur)),
            (data)async {
              SharedPrefUtil.setValue(PrefType.STRING, PrefKey.token, data.token);
              SharedPrefUtil.setValue(PrefType.STRING, PrefKey.refreshToken, data.refreshToken);
              emit(state.copyWith(status: RefreshStatus.refreshSuccess));


            }
          );
     }  );
  
  }
late UseCase _postRefreshToken;
final AuthRepository repository;
}