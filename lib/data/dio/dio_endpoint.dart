
class DioEndpoint {
  factory DioEndpoint(String apiBaseUrl) {
    _instance._apiBaseUrl = apiBaseUrl;
    return _instance;
  }

  DioEndpoint._internal();

  static final DioEndpoint _instance = DioEndpoint._internal();

  static DioEndpoint get instance => _instance;

  String? _apiBaseUrl;

  String get verifyEmail => '$_apiBaseUrl/account/verifyEmail';
  String get register => '$_apiBaseUrl/account';
  String get generateToken => '$_apiBaseUrl/token/generate';
}
