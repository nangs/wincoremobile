// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this

class AccountActivitiesRequest {
  String? username;
  String? accountno;
  String? mpin;
  String? startdate;
  String? enddate;
  String? sequenceno;

  AccountActivitiesRequest(
      {this.username,
      this.accountno,
      this.mpin,
      this.startdate,
      this.enddate,
      this.sequenceno});

  AccountActivitiesRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    accountno = json['accountno'];
    mpin = json['mpin'];
    startdate = json['startdate'];
    enddate = json['enddate'];
    sequenceno = json['sequenceno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['accountno'] = this.accountno;
    data['mpin'] = this.mpin;
    data['startdate'] = this.startdate;
    data['enddate'] = this.enddate;
    data['sequenceno'] = this.sequenceno;
    return data;
  }
}
