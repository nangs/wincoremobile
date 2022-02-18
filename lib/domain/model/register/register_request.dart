// ignore_for_file: unnecessary_new, unnecessary_this, prefer_collection_literals

class RegisterRequest {
  String? accountno;
  String? identityno;
  String? birthdate;
  String? username;
  String? password;
  String? mpin;
  String? phonenum;

  RegisterRequest(
      {this.accountno,
      this.identityno,
      this.birthdate,
      this.username,
      this.password,
      this.mpin,
      this.phonenum});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    accountno = json['accountno'];
    identityno = json['identityno'];
    birthdate = json['birthdate'];
    username = json['username'];
    password = json['password'];
    mpin = json['mpin'];
    phonenum = json['phonenum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountno'] = this.accountno;
    data['identityno'] = this.identityno;
    data['birthdate'] = this.birthdate;
    data['username'] = this.username;
    data['password'] = this.password;
    data['mpin'] = this.mpin;
    data['phonenum'] = this.phonenum;
    return data;
  }
}
