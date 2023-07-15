import '../network/error_message_model.dart';

class ServerException implements Exception {
  final String errorMessage;

  const ServerException({required this.errorMessage});
}

class LocalException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const LocalException({required this.errorMessageModel});
}
