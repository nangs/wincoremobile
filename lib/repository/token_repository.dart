// ignore_for_file: avoid_print, non_constant_identifier_names

// import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:wincoremobile/domain/model/token_response.dart';
import 'package:wincoremobile/api/api_rest.dart';

class TokenRepository {
  final Dio _dio = Dio();

  // Future<>
  Future<String> GetToken() async {
    Response _response;

    try {
      // Map<String, dynamic> requestData = {
      //   "username": username,
      //   "password": password,
      // };

      // _response = await _dio.post(
      //   "https://10.16.31.128:8443/mobileservice/GetToken",
      //   // data: requestData,
      //   data: {'win_token': 'wincore'},
      //   // options: Options(
      //   //   contentType: Headers.formUrlEncodedContentType,
      //   // ),

      _response = await _dio.request(
        ApiRest.getToken().toString(),
        options: Options(method: 'GET', headers: {'win_token': 'wincore'}),
      );

      // public IP
      // _response = await _dio.request(
      //   'https://103.2.146.173:8443/mobileservice/GetToken',
      //   options: Options(method: 'GET', headers: {'win_token': 'wincore'}),
      // );

      TokenResponse tokenResponse = TokenResponse.fromJson(_response.data);
      // print(tokenResponse.request_token);
      return tokenResponse.request_token.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
