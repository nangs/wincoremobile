// ignore_for_file: unnecessary_this, prefer_collection_literals, unnecessary_new, file_names

class ForgotPasswordValidateRequest {
  String? username;
  String? phonenum;
  String? procedure;

  ForgotPasswordValidateRequest({
    this.username,
    this.phonenum,
    this.procedure,
  });

  ForgotPasswordValidateRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phonenum = json['phonenum'];
    procedure = json['procedure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['phonenum'] = this.phonenum;
    data['procedure'] = this.procedure;
    return data;
  }
}

class ForgotPasswordVerificationDataRequest {
  String? username;
  String? phonenum;
  String? procedure;
  String? accountno;
  String? identityno;
  String? birthdate;

  ForgotPasswordVerificationDataRequest({
    this.username,
    this.phonenum,
    this.procedure,
    this.accountno,
    this.identityno,
    this.birthdate,
  });

  ForgotPasswordVerificationDataRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phonenum = json['phonenum'];
    procedure = json['procedure'];
    accountno = json['accountno'];
    identityno = json['identityno'];
    birthdate = json['birthdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['phonenum'] = this.phonenum;
    data['procedure'] = this.procedure;
    data['accountno'] = this.accountno;
    data['identityno'] = this.identityno;
    data['birthdate'] = this.birthdate;
    return data;
  }
}

class ForgotPasswordSetNewPassRequest {
  String? username;
  String? phonenum;
  String? procedure;
  String? newpass;

  ForgotPasswordSetNewPassRequest(
      {this.username, this.phonenum, this.procedure, this.newpass});

  ForgotPasswordSetNewPassRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    phonenum = json['phonenum'];
    procedure = json['procedure'];
    newpass = json['newpass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['phonenum'] = this.phonenum;
    data['procedure'] = this.procedure;
    data['newpass'] = this.newpass;
    return data;
  }
}
