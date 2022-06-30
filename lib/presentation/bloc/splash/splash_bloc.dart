import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boilerplate/presentation/bloc/splash/splash_event.dart';
import 'package:boilerplate/presentation/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  SplashBloc(SplashState initialState) : super(initialState);
}