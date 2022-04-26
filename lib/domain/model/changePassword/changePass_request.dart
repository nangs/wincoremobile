// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this

class PassRequest {
  String? username;
  String? oldpass;
  String? newpass;

  PassRequest({
    this.username,
    this.oldpass,
    this.newpass,
  });

  PassRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    oldpass = json['oldpass'];
    newpass = json['newpass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['oldpass'] = oldpass;
    data['newpass'] = newpass;
    return data;
  }
}
