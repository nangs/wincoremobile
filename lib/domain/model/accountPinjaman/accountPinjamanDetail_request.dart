// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this

class PinjamanDetailRequest {
  String? username;
  String? mpin;
  String? loanno;

  PinjamanDetailRequest({
    this.username,
    this.mpin,
    this.loanno,
  });

  PinjamanDetailRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    mpin = json['mpin'];
    loanno = json['loanno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['mpin'] = this.mpin;
    data['loanno'] = this.loanno;
    return data;
  }
}
