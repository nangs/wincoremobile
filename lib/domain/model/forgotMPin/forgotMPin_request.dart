// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, file_names

class ForgotMPinRequest {
  String? username;
  String? accountno;
  String? identityno;
  String? birthdate;
  String? newpin;

  ForgotMPinRequest(
      {this.username,
      this.accountno,
      this.identityno,
      this.birthdate,
      this.newpin});

  ForgotMPinRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    accountno = json['accountno'];
    identityno = json['identityno'];
    birthdate = json['birthdate'];
    newpin = json['newpin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['accountno'] = this.accountno;
    data['identityno'] = this.identityno;
    data['birthdate'] = this.birthdate;
    data['newpin'] = this.newpin;
    return data;
  }
}
