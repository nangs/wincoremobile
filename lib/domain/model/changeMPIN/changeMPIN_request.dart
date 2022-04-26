// ignore_for_file: prefer_collection_literals, file_names

class MpinRequest {
  String? username;
  String? oldpin;
  String? newpin;

  MpinRequest({
    this.username,
    this.oldpin,
    this.newpin,
  });

  MpinRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    oldpin = json['oldpin'];
    newpin = json['newpin'];
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_new
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['oldpin'] = oldpin;
    data['newpin'] = newpin;
    return data;
  }
}
