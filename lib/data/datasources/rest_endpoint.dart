
class RestEndpoint {
  factory RestEndpoint(String apiBaseUrl) {
    _instance._apiBaseUrl = apiBaseUrl;
    return _instance;
  }

  RestEndpoint._internal();

  static final RestEndpoint _instance = RestEndpoint._internal();

  static RestEndpoint get instance => _instance;

  String? _apiBaseUrl;

  String get register => '$_apiBaseUrl/todos';
  String get login => '$_apiBaseUrl/todos';
}
