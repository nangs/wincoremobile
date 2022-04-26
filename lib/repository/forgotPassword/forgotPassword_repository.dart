// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_response.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_request.dart';
import 'package:wincoremobile/api/api_rest.dart';

class ForgotPasswordRepository {
  final Dio _dio = Dio();

  Future<Either<String, ForgotPasswordResponse>>
      verificationDataForgotPassword({
    required String token,
    required ForgotPasswordVerificationDataRequest
        forgotPasswordVerificationDataRequest,
  }) async {
    Response _response;

    try {
      print("tokennya : " + token);
      print("json : " +
          forgotPasswordVerificationDataRequest.toJson().toString());

      _response = await _dio.post(
        ApiRest.forgotPassword().toString(),
        data: jsonDecode(jsonEncode(
            {"message": jsonEncode(forgotPasswordVerificationDataRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/ForgotPass",
      //   data: jsonDecode(jsonEncode(
      //       {"message": jsonEncode(forgotPasswordVerificationDataRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      ForgotPasswordResponse forgotPasswordResponse =
          ForgotPasswordResponse.fromJson(_response.data);
      print("Response : " + forgotPasswordResponse.status.toString());
      //right itu untuk sukses
      return right(forgotPasswordResponse);
    } on DioError catch (e) {
      //error dari dio

      print("status code : ");
      print(e.response?.statusCode);
      print("response data : ");
      print(e.response?.data);
      print("response Header : ");
      print(e.response?.headers);
      print("response requestOptions : ");
      print(e.response?.requestOptions);
      var errorMessage = e.response?.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.sendTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.receiveTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.response:
          // Dio Error Handler
          errorMessage = e.response?.data['status'];
          break;
        case DioErrorType.cancel:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.other:
          // Dio Error Handler
          errorMessage = e.error.toString();
          break;
      }
      print("Error Message : " + errorMessage.toString());
      //left itu untuk error
      return left(errorMessage.toString());
    }
  }

  Future<Either<String, ForgotPasswordResponse>> validateDataForgotPassword({
    required String token,
    required ForgotPasswordValidateRequest forgotPasswordValidateRequest,
  }) async {
    Response _response;

    try {
      print("tokennya : " + token);
      print("json : " + forgotPasswordValidateRequest.toJson().toString());

      _response = await _dio.post(
        "https://10.16.31.128:8443/mobileservice/ForgotPass",
        data: jsonDecode(
            jsonEncode({"message": jsonEncode(forgotPasswordValidateRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/ForgotPass",
      //   data: jsonDecode(
      //       jsonEncode({"message": jsonEncode(forgotPasswordValidateRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      ForgotPasswordResponse forgotPasswordResponse =
          ForgotPasswordResponse.fromJson(_response.data);
      print("Response : " + forgotPasswordResponse.status.toString());
      //right itu untuk sukses
      return right(forgotPasswordResponse);
    } on DioError catch (e) {
      //error dari dio

      print("status code : ");
      print(e.response?.statusCode);
      print("response data : ");
      print(e.response?.data);
      print("response Header : ");
      print(e.response?.headers);
      print("response requestOptions : ");
      print(e.response?.requestOptions);
      var errorMessage = e.response?.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.sendTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.receiveTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.response:
          // Dio Error Handler
          errorMessage = e.response?.data['status'];
          break;
        case DioErrorType.cancel:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.other:
          // Dio Error Handler
          errorMessage = e.error.toString();
          break;
      }
      print("Error Message : " + errorMessage.toString());
      //left itu untuk error
      return left(errorMessage.toString());
    }
  }

  Future<Either<String, ForgotPasswordResponse>> forgotPasswordSetNewPass({
    required String token,
    required ForgotPasswordSetNewPassRequest forgotPasswordSetNewPassRequest,
  }) async {
    Response _response;

    try {
      print("tokennya : " + token);
      print("json : " + forgotPasswordSetNewPassRequest.toJson().toString());

      _response = await _dio.post(
        "https://10.16.31.128:8443/mobileservice/ForgotPass",
        data: jsonDecode(jsonEncode(
            {"message": jsonEncode(forgotPasswordSetNewPassRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/ForgotPass",
      //   data: jsonDecode(jsonEncode(
      //       {"message": jsonEncode(forgotPasswordSetNewPassRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      ForgotPasswordResponse forgotPasswordResponse =
          ForgotPasswordResponse.fromJson(_response.data);
      print("Response : " + forgotPasswordResponse.status.toString());
      //right itu untuk sukses
      return right(forgotPasswordResponse);
    } on DioError catch (e) {
      //error dari dio

      print("status code : ");
      print(e.response?.statusCode);
      print("response data : ");
      print(e.response?.data);
      print("response Header : ");
      print(e.response?.headers);
      print("response requestOptions : ");
      print(e.response?.requestOptions);
      var errorMessage = e.response?.data.toString();
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.sendTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.receiveTimeout:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.response:
          // Dio Error Handler
          errorMessage = e.response?.data['status'];
          break;
        case DioErrorType.cancel:
          // Dio Error Handler
          errorMessage = e.message;
          break;
        case DioErrorType.other:
          // Dio Error Handler
          errorMessage = e.error.toString();
          break;
      }
      print("Error Message : " + errorMessage.toString());
      //left itu untuk error
      return left(errorMessage.toString());
    }
  }
}
