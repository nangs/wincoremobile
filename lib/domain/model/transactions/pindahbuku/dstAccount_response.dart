// ignore_for_file: file_names, unnecessary_this, unnecessary_new, prefer_collection_literals

class DestinationAccountLoadResponse {
  String? status;
  Info? info;

  DestinationAccountLoadResponse({this.status, this.info});

  DestinationAccountLoadResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    return data;
  }
}

class Info {
  List<DstAccount>? dstAccount;

  Info({this.dstAccount});

  Info.fromJson(Map<String, dynamic> json) {
    if (json['dst_account'] != null) {
      dstAccount = <DstAccount>[];
      json['dst_account'].forEach((v) {
        dstAccount!.add(new DstAccount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dstAccount != null) {
      data['dst_account'] = this.dstAccount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DstAccount {
  String? accountName;
  String? accountNo;

  DstAccount({this.accountName, this.accountNo});

  DstAccount.fromJson(Map<String, dynamic> json) {
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

class DestinationAccountAddRemoveResponse {
  String? status;

  DestinationAccountAddRemoveResponse({this.status});

  DestinationAccountAddRemoveResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}
