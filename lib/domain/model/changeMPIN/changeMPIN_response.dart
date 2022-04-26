// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this

class MpinResponse {
  String? status;

  MpinResponse({this.status});

  MpinResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
