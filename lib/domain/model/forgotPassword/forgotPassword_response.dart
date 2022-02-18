// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

class ForgotPasswordResponse {
  String? status;

  ForgotPasswordResponse({this.status});

  ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
