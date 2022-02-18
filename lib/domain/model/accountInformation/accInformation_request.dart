// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this

class AccountInfoRequest {
  String? username;
  String? accountno;
  String? mpin;

  AccountInfoRequest({this.username, this.accountno, this.mpin});

  AccountInfoRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    accountno = json['accountno'];
    mpin = json['mpin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['accountno'] = this.accountno;
    data['mpin'] = this.mpin;
    return data;
  }
}
