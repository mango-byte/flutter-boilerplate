class ApiException implements Exception {
  const ApiException(this.message, [this.errors]);
  final String message;
  final Map<String, dynamic>? errors;

  @override
  String toString() {
    return message;
  }
}