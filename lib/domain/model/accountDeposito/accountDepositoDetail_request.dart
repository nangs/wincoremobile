// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

class DepositoDetailRequest {
  String? username;
  String? mpin;
  String? depositno;

  DepositoDetailRequest({
    this.username,
    this.mpin,
    this.depositno,
  });

  DepositoDetailRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    mpin = json['mpin'];
    depositno = json['depositno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['mpin'] = this.mpin;
    data['depositno'] = this.depositno;
    return data;
  }
}
