import 'package:boilerplate/domain/entities/register_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class RegisterModel extends Equatable {
  RegisterModel({
    @required required this.id,
    @required required this.email,
    @required required this.firstName,
    @required required this.lastName,
    @required required this.createdAt,
    @required this.updatedAt
  });

  factory RegisterModel.fromJson(dynamic json) => RegisterModel(
    id: json['id'] as int,
    email: json['email'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String
  );

  RegisterResponse toEntity() => RegisterResponse(
      email: email,
      firstName: firstName,
      lastName: lastName
  );

  int id;
  String email;
  String firstName;
  String lastName;
  String createdAt;
  String? updatedAt;

  @override
  List<Object?> get props => [];
}