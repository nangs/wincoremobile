// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class RegisterResponse {
  Info? info;
  String? status;

  RegisterResponse({this.info, this.status});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Info {
  String? accountName;

  Info({this.accountName});

  Info.fromJson(Map<String, dynamic> json) {
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_name'] = this.accountName;
    return data;
  }
}
