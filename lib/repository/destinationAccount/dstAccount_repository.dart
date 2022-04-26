// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print, non_constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_request.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_response.dart';
import 'package:wincoremobile/api/api_rest.dart';

class DestinationAccountRepository {
  final Dio _dio = Dio();

  // Future<>
  Future<Either<String, DestinationAccountLoadResponse>> getDestinationAccount({
    required String token,
    required DestinationAccountRequest destinationAccountRequest,
  }) async {
    Response _response;

    try {
      // print("tokennya : " + token);
      // print("json destinationAccountRequest encoded : " +
      //     jsonDecode(jsonEncode(
      //         {"message": jsonEncode(destinationAccountRequest)})).toString());

      _response = await _dio.post(
        ApiRest.destinationAccount().toString(),
        data: jsonDecode(
            jsonEncode({"message": jsonEncode(destinationAccountRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/DstAccount",
      //   data: jsonDecode(
      //       jsonEncode({"message": jsonEncode(destinationAccountRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      DestinationAccountLoadResponse destinationAccountResponse =
          DestinationAccountLoadResponse.fromJson(_response.data);
      print(destinationAccountResponse.status);
      print(destinationAccountResponse.info?.dstAccount);

      //right itu untuk sukses
      return right(destinationAccountResponse);
    } on DioError catch (e) {
      print("status code dstAcc : ");
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

  Future<Either<String, DestinationAccountAddRemoveResponse>>
      setDestinationAccount({
    required String token,
    required DestinationAccountRequest destinationAccountRequest,
  }) async {
    Response _response;

    try {
      // print("tokennya : " + token);
      // print("json destinationAccountRequest encoded : " +
      //     jsonDecode(jsonEncode(
      //         {"message": jsonEncode(destinationAccountRequest)})).toString());

      _response = await _dio.post(
        "https://10.16.31.128:8443/mobileservice/DstAccount",
        data: jsonDecode(
            jsonEncode({"message": jsonEncode(destinationAccountRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/DstAccount",
      //   data: jsonDecode(
      //       jsonEncode({"message": jsonEncode(destinationAccountRequest)})),
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      DestinationAccountAddRemoveResponse destinationAccountResponse =
          DestinationAccountAddRemoveResponse.fromJson(_response.data);
      print(destinationAccountResponse.status);

      //right itu untuk sukses
      return right(destinationAccountResponse);
    } on DioError catch (e) {
      print("status code dstAcc : ");
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
