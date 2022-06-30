
import 'package:boilerplate/data/datasources/rest_service.dart';
import 'package:boilerplate/data/models/register_model.dart';


abstract class AuthDataSource {
  Future<RegisterModel> register(String username, String password);
}

class AuthDataSourceImpl implements AuthDataSource {

  @override
  Future<RegisterModel> register(String username, String password) async {
    final response = await RestService.request(url: 'url', method: Method.post, param: {
      'email' : username,
      'password' : password
    });
    return RegisterModel.fromJson(response.data);
  }
}