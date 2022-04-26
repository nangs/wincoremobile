// ignore_for_file: avoid_print, unnecessary_new

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/auth/auth_request.dart';
import 'package:wincoremobile/domain/model/auth/auth_response.dart';
import 'package:wincoremobile/api/api_rest.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<Either<String, AuthResponse>> signInUserWithUsernameAndPassword({
    required String token,
    required AuthRequest authRequest,
  }) async {
    Response _response;
    // Response _tokenResponse;

    try {
      print("tokennya : " + token);
      print("json : " + authRequest.toJson().toString());

      _response = await _dio.post(
        ApiRest.loginAuth().toString(),
        data: jsonDecode(jsonEncode({"message": jsonEncode(authRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/Login",
      //   data: jsonDecode(jsonEncode({"message": jsonEncode(authRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      AuthResponse authResponse = AuthResponse.fromJson(_response.data);
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
