// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, file_names, avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/forgotMPin/forgotMPin_request.dart';
import 'package:wincoremobile/domain/model/forgotMPin/forgotMPin_response.dart';

class ForgotMPinRepository {
  final Dio _dio = Dio();

  Future<Either<String, ForgotMPinResponse>> verificationDataForgotMPin({
    required String token,
    required ForgotMPinRequest forgotMPinRequest,
  }) async {
    Response _response;

    try {
      print("tokennya : " + token);
      print("json : " + forgotMPinRequest.toJson().toString());

      _response = await _dio.post(
        "https://103.2.146.173:8443/mobileservice/ForgotPIN",
        data:
            jsonDecode(jsonEncode({"message": jsonEncode(forgotMPinRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      ForgotMPinResponse authResponse =
          ForgotMPinResponse.fromJson(_response.data);
      print(authResponse.status);

      //right itu untuk sukses
      return right(authResponse);
    } on DioError catch (e) {
      print("status code : ");
      print(e.response?.statusCode);
      print(e.response?.data);
      print(e.response?.headers);
      print(e.response?.requestOptions);
      var errorMessage = e.response?.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.sendTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.receiveTimeout:
          // Dio Error Handler
          break;
        case DioErrorType.response:
          // Dio Error Handler
          errorMessage = e.response?.data['status'];
          break;
        case DioErrorType.cancel:
          // Dio Error Handler
          break;
        case DioErrorType.other:
          // Dio Error Handler
          break;
      }
      return left("dio error : " + errorMessage.toString());
    }
  }
}
