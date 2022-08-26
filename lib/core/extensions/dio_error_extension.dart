import 'dart:io';

import 'package:dio/dio.dart';

import '../models/error_model.dart';

extension DioErrorX on DioError {
  String? get errorMessage {
    if (error is SocketException) {
      return 'No Internet Connection';
    }
    return ErrorModel.fromJson(response?.data).error;
  }
}
