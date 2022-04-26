// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print, non_constant_identifier_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/konfirmasipindahbuku_request.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/konfirmasipindahbuku_response.dart';
import 'package:wincoremobile/api/api_rest.dart';

class KonfirmasiPindahBukuRepository {
  final Dio _dio = Dio();

  // Future<>
  Future<Either<String, TransferConfirmationPBResponse>> GetAccountName({
    required String token,
    required TransferConfirmationPBRequest transferConfirmationPBRequest,
  }) async {
    Response _response;

    try {
      print("tokennya : " + token);
      print("json : " + transferConfirmationPBRequest.toJson().toString());

      _response = await _dio.post(
        ApiRest.transKonfirmasiPB().toString(),
        data: {"message": transferConfirmationPBRequest.toJson().toString()},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      // Public IP
      // _response = await _dio.post(
      //   "https://103.2.146.173:8443/mobileservice/AccountName",
      //   data: {"message": transferConfirmationPBRequest.toJson().toString()},
      //   options: Options(
      //     contentType: Headers.formUrlEncodedContentType,
      //     method: 'POST',
      //     headers: {'win_token': token.toString()},
      //   ),
      // );

      TransferConfirmationPBResponse transferConfirmationPBResponse =
          TransferConfirmationPBResponse.fromJson(_response.data);
      print(transferConfirmationPBResponse.status);

      //right itu untuk sukses
      return right(transferConfirmationPBResponse);
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
