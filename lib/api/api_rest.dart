import 'package:wincoremobile/api/api_config.dart';
import 'globals.dart' as globals;
import 'package:http/http.dart' as http;

class ApiRest {
  static configPost(String url) {
    var uri = "";
    if (!globals.switchAPIurl) {
      uri = ApiConfig.apiurl1 + url;
    } else {
      uri = ApiConfig.apiurl2 + url;
    }

    return uri;
  }

  static configPingGet(String url, var data) async {
    // ignore: prefer_typing_uninitialized_variables
    var response;
    Uri uri;
    if (!globals.switchAPIurl) {
      uri = Uri.parse(ApiConfig.apiurl1 + url);
    } else {
      uri = Uri.parse(ApiConfig.apiurl2 + url);
    }

    try {
      response = await http.get(uri, headers: data);
    } catch (ex) {
      response = null;
      // print(ex);
    }
    // print(uri);
    return response;
  }

  static accountActivities() {
    return configPost("AccountActivity");
  }

  static accountBalance() {
    return configPost("AccountInfo");
  }

  static accountDepositoPortfolio() {
    return configPost("Portfolio");
  }

  static accountDepositoInfo() {
    return configPost("DepositInfo");
  }

  static accountPinjamanPortfolio() {
    return configPost("Portfolio");
  }

  static accountPinjamanInfo() {
    return configPost("LoanInfo");
  }

  static loginAuth() {
    return configPost("Login");
  }

  static changeMPIN() {
    return configPost("ChangePIN");
  }

  static changePass() {
    return configPost("ChangePass");
  }

  static destinationAccount() {
    return configPost("DstAccount");
  }

  static forgotMPIN() {
    return configPost("ForgotPIN");
  }

  static forgotPassword() {
    return configPost("ForgotPass");
  }

  static portFolio() {
    return configPost("Portfolio");
  }

  static register() {
    return configPost("Register");
  }

  static transKonfirmasiPB() {
    return configPost("AccountName");
  }

  static transPB() {
    return configPost("TransPB");
  }

  static getToken() {
    return configPost("GetToken");
  }

  static ping(var data) {
    return configPingGet("GetToken", data);
  }
}
