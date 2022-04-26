// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this
class PortfolioRequest {
  String? username;
  String? mpin;
  String? sequenceno;
  String? filter;

  PortfolioRequest({
    this.username,
    this.mpin,
    this.sequenceno,
    this.filter,
  });

  PortfolioRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    mpin = json['mpin'];
    sequenceno = json['sequenceno'];
    filter = json['filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['mpin'] = this.mpin;
    data['sequenceno'] = this.sequenceno;
    data['filter'] = this.filter;
    return data;
  }
}
