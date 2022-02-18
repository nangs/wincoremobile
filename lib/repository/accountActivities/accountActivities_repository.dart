// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_request.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_response.dart';
import 'package:http/http.dart' as http;

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

      var headers = {
        'win_token': token.toString(),
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      var request = http.Request(
          'POST',
          Uri.parse(
              'https://103.2.146.173:8443/mobileservice/AccountActivity'));
      request.bodyFields = {'message': jsonEncode(accountActivitiesRequest)};
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }

      print('Finish');
      // final _response = await http.post(
      //     'https://103.2.146.173:8443/mobileservice/AccountActivity',
      //     body: "send this string via POST",
      //     headers: {
      //       'win_token': token.toString(),
      //     });

      _response = await _dio.post(
        "https://103.2.146.173:8443/mobileservice/AccountActivity",
        data: jsonDecode(
            jsonEncode({"message": jsonEncode(accountActivitiesRequest)})),
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          method: 'POST',
          headers: {'win_token': token.toString()},
        ),
      );

      AccountActivitiesResponse accountActivitiesResponse =
          AccountActivitiesResponse.fromJson(_response.data);
      Mutasi mutasi = Mutasi.fromJson(_response.data);
      //print(_response);
      print(accountActivitiesResponse);
      print(mutasi);

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
