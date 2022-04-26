// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDepositoDetail_request.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDepositoDetail_response.dart';
import 'package:wincoremobile/api/api_rest.dart';

class DepositoDetailRepository {
  final Dio _dio = Dio();

  // Future<>
  Future<Either<String, DepositoDetailResponse>> getDeposito({
    required String token,
    required DepositoDetailRequest depositoRequest,
  }) async {
    Response _response;

    try {
      print("tokennya : " + token);
      print("json : " + depositoRequest.toJson().toString());
      print("json encoded : " +
          jsonDecode(jsonEncode({"message": jsonEncode(depositoRequest)}))
              .toString());

      _response = await _dio.post(
        ApiRest.accountDepositoInfo().toString(),
        data: jsonDecode(jsonEncode({"message": jsonEncode(depositoRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/DepositInfo",
      //   data: jsonDecode(jsonEncode({"message": jsonEncode(depositoRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      DepositoDetailResponse depositoResponse =
          DepositoDetailResponse.fromJson(_response.data);
      print(depositoResponse.status);

      //right itu untuk sukses
      return right(depositoResponse);
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
