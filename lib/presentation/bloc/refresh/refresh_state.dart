

import 'package:boilerplate/domain/entities/token_response.dart';
import 'package:equatable/equatable.dart';

enum RefreshStatus{ initail , loading , refreshFailur, refreshSuccess}

class RefreshState extends Equatable{

  const RefreshState({
    this.email,
    this.refreshToken,
    this.response,
    required this.status,

  });
  final String? email;
  final String? refreshToken;
  final RefreshStatus status;
  final TokenResponse? response;

  RefreshState copyWith({
    String? email,
    String? refreshToken,
    TokenResponse? response,
    required RefreshStatus status,

  }){
    return RefreshState(
      email :email ?? this.email,
      refreshToken:  refreshToken ?? this.refreshToken,
      response: response ?? this.response,
      status: status
    );
  }
  @override
  List<Object?> get props => [email,refreshToken, status];

}