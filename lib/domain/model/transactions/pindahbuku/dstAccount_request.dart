// ignore_for_file: file_names, unnecessary_this, unnecessary_new, prefer_collection_literals

class DestinationAccountRequest {
  String? username;
  String? mpin;
  String? procedure;
  List<DstAccount>? dstAccount;

  DestinationAccountRequest(
      {this.username, this.mpin, this.procedure, this.dstAccount});

  DestinationAccountRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    mpin = json['mpin'];
    procedure = json['procedure'];
    if (json['dst_account'] != null) {
      dstAccount = <DstAccount>[];
      json['dst_account'].forEach((v) {
        dstAccount!.add(new DstAccount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['mpin'] = this.mpin;
    data['procedure'] = this.procedure;
    if (this.dstAccount != null) {
      data['dst_account'] = this.dstAccount!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DstAccount {
  String? accountNo;
  String? accountName;

  DstAccount({this.accountNo, this.accountName});

  DstAccount.fromJson(Map<String, dynamic> json) {
    accountNo = json['account_no'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_no'] = this.accountNo;
    data['account_name'] = this.accountName;
    return data;
  }
}
