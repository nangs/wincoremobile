// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class AuthRequest {
  String? username;
  // String? email;
  String? password;

  AuthRequest({
    this.username,
    this.password,
  });

  AuthRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    // email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    // data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
