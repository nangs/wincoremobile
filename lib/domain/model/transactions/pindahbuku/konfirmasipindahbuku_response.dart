// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals, camel_case_types

class TransferConfirmationPBResponse {
  Info? info;
  String? status;

  TransferConfirmationPBResponse({this.info, this.status});

  TransferConfirmationPBResponse.fromJson(Map<String, dynamic> json) {
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
  String? accountNo;

  Info({this.accountName, this.accountNo});

  Info.fromJson(Map<String, dynamic> json) {
    accountName = json['account_name'];
    accountNo = json['account_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_name'] = this.accountName;
    data['account_no'] = this.accountNo;
    return data;
  }
}
