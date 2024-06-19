import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage;
  Failure({required this.errMessage});
}
class InternetFailure extends Failure{
  InternetFailure({required super.errMessage});
}
class FirebaseFailure extends Failure{
  FirebaseFailure({required super.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});
  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(
            errMessage: 'your browser fails to validate your certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.badResponse(
            dioException.response!.statusCode!, dioException.response!);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to api server was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(errMessage: 'No internet connection , try again');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'unexpected error try again');
      default:
        return ServerFailure(errMessage: 'OOPS there was an error please try again!');
    }
  }

  factory ServerFailure.badResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure(
          errMessage: 'Your Request Not Found Please Try later!');
    } else if (statusCode == 500) {
      return ServerFailure(
          errMessage: 'Internal Server Error Please Try later!');
    } else {
      return ServerFailure(
          errMessage: 'OOPS there was an error please try again!');
    }
  }
}

