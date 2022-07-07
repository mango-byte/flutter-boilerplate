
import 'package:equatable/equatable.dart';

abstract class RefreshEvent extends Equatable{
  const RefreshEvent();

    @override
  List<Object?> get props => [];
}

class RefreshButtonPressed extends RefreshEvent{
  const RefreshButtonPressed({ required this.email, required this.refreshToken});
  final String email;
  final String refreshToken;

   @override
  List<Object> get props => [email, refreshToken];

}