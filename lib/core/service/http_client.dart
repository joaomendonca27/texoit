import 'dart:developer';

import 'package:dio/dio.dart';

import '../error/error_core.dart';
import '../error/model/erro_model.dart';
import 'i_http_service.dart';

class HttpClient implements IHttpService {
  final Dio client;
  late Response response;

  HttpClient({required this.client});

  @override
  Future get(String url) async {
    try {
      response = await client.get(url);
    } catch (error) {
      _catchRequest(error);
    }
    return _handleResponse(response);
  }

  static String baseUrl = 'https://tools.texoit.com/backend-java/api/movies/';

  _catchRequest(dynamic error) {
    if (error is DioException) {
      _handleResponse(error.response!);
    } else {
      if (error == DioExceptionType.cancel) {
        throw CanceledError();
      } else {
        throw Failure();
      }
    }
  }

  _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 202:
      case 204:
        return response.data;
      case 400:
        ErrorModelCore errorModel = ErrorModelCore(
          status: response.statusCode.toString(),
          message:
              'O servidor não vai processar a requisição por um erro nas informações enviadas.',
        );
        log(' ERROR MESSAGE ----> ${errorModel.message}');
        throw errorModel;
      case 401:
        ErrorModelCore errorModel = ErrorModelCore(
          status: response.statusCode.toString(),
          message:
              'O cliente não forneceu as credenciais corretas para acessar o recurso.',
        );
        log(' ERROR MESSAGE ----> ${errorModel.message}');
        throw errorModel;
      case 403:
        ErrorModelCore errorModel = ErrorModelCore(
          status: response.statusCode.toString(),
          message:
              'O servidor recebeu a requisição, mas se negou a autorizá-la.',
        );
        log(' ERROR MESSAGE ----> ${errorModel.message}');
        throw errorModel;
      case 404:
        ErrorModelCore errorModel = ErrorModelCore(
          status: response.statusCode.toString(),
          message:
              'O servidor não encontrou uma representação atual do recurso solicitado.',
        );
        log(' ERROR MESSAGE ----> ${errorModel.message}');
        throw errorModel;
      case 422:
        throw UnprocessableEntityError(
            data: (response.data == null || response.data.isEmpty)
                ? null
                : Map<String, dynamic>.from(response.data));
      case 500:
        throw Failure();
      default:
        throw ServerError();
    }
  }
}
