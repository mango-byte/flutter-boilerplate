import 'package:boilerplate/data/dio/dio_endpoint.dart';
import 'package:boilerplate/data/dio/dio_service.dart';
import 'package:boilerplate/data/models/register_model.dart';
import 'package:boilerplate/data/models/token_model.dart';
import 'package:boilerplate/domain/usecases/post_refresh_token.dart';
import 'package:boilerplate/domain/usecases/post_register_user.dart';

abstract class AuthDataSource {
  Future<String> verifyEmail(String email);
  Future<RegisterModel> register(RegisterRequest request);
  Future<TokenModel> generateToken(String email, String password);
  Future<TokenModel> refreshToken(RefreshTokenRequest request);
}

class AuthDataSourceImpl implements AuthDataSource {
  AuthDataSourceImpl({required this.service});
  RestService service;

  @override
  Future<String> verifyEmail(String email) async {
    final response = await service.request(
        url: '${DioEndpoint.instance.verifyEmail}/$email', method: Method.post);
    return response.data;
  }

  @override
  Future<RegisterModel> register(RegisterRequest request) async {
    final response = await service.request(
        url: DioEndpoint.instance.register,
        method: Method.post,
        param: request.toJson());
    return RegisterModel.fromJson(response.data);
  }

  @override
  Future<TokenModel> generateToken(String email, String password) async {
    final response = await service.request(
        url: DioEndpoint.instance.generateToken,
        method: Method.post,
        credentials: '$email:$password');
    return TokenModel.fromJson(response.data);
  }

  @override
  Future<TokenModel> refreshToken(RefreshTokenRequest request) async {
    final response = await service.request(
        url: DioEndpoint.instance.refreshtoken,
        method: Method.post,
        param: request.toJson()
        );
    return TokenModel.fromJson(response.data);
  }


}
