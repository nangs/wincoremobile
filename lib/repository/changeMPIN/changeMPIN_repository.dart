// ignore_for_file: avoid_print, unnecessary_new, file_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/changeMPIN/changeMPIN_request.dart';
import 'package:wincoremobile/domain/model/changeMPIN/changeMPIN_response.dart';
import 'package:wincoremobile/api/api_rest.dart';

class MpinRepository {
  final Dio _dio = Dio();

  // ignore: non_constant_identifier_names
  Future<Either<String, MpinResponse>> changeNewMPIN({
    required String token,
    required MpinRequest mpinRequest,
  }) async {
    Response _response;
    // Response _tokenResponse;

    try {
      print("tokennya : " + token);
      print("json : " + mpinRequest.toJson().toString());

      _response = await _dio.post(
        ApiRest.changeMPIN().toString(),
        data: jsonDecode(jsonEncode({"message": jsonEncode(mpinRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/ChangePIN",
      //   data: jsonDecode(jsonEncode({"message": jsonEncode(mpinRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      MpinResponse mpinResponse = MpinResponse.fromJson(_response.data);
      print(mpinResponse.status);

      //right itu untuk sukses
      return right(mpinResponse);
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
