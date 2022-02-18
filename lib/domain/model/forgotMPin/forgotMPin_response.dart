// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, file_names

class ForgotMPinResponse {
  String? status;

  ForgotMPinResponse({this.status});

  ForgotMPinResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
