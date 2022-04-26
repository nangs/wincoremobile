// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_request.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_response.dart';
import 'package:wincoremobile/api/api_rest.dart';

class AccountActivitiesRepository {
  final Dio _dio = Dio();

  Future<Either<String, AccountActivitiesResponse>> getAccountActivities({
    required String token,
    required AccountActivitiesRequest accountActivitiesRequest,
  }) async {
    Response _response;
    try {
      print("tokennya : " + token);
      print("json : " + accountActivitiesRequest.toJson().toString());

      _response = await _dio.post(
        ApiRest.accountActivities().toString(),
        data: jsonDecode(
            jsonEncode({"message": jsonEncode(accountActivitiesRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/AccountActivity",
      //   data: jsonDecode(
      //       jsonEncode({"message": jsonEncode(accountActivitiesRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      AccountActivitiesResponse accountActivitiesResponse =
          AccountActivitiesResponse.fromJson(_response.data);

      print(accountActivitiesResponse);

      //right itu untuk sukses
      return right(accountActivitiesResponse);
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
