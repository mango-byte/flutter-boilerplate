
import 'package:boilerplate/presentation/bloc/home/home_events.dart';
import 'package:boilerplate/presentation/bloc/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeBloc() : super(HomeInitialState());
}