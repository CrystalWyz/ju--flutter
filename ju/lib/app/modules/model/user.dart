class User {
  String? username;
  String? token;
  int? expireTime;

  User({this.username, this.token, this.expireTime});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    token = json['token'];
    expireTime = json['expireTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['token'] = token;
    data['expireTime'] = expireTime;
    return data;
  }
}