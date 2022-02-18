// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, non_constant_identifier_names

class TokenResponse {
  String? request_token;

  TokenResponse({this.request_token});

  TokenResponse.fromJson(Map<String, dynamic> json) {
    request_token = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_token'] = this.request_token;
    return data;
  }
}
