class MurderMysteryUser {

  int? userId;
  String? username;
  String? gender;
  int? blemishCount;
  int? grade;
  int? count;

  MurderMysteryUser({this.userId, this.username, this.gender, this.blemishCount,this.grade,this.count});

  MurderMysteryUser.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
    gender = json['gender'];
    blemishCount = json['blemishCount'];
    grade = json['grade'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['username'] = username;
    data['gender'] = gender;
    data['blemishCount'] = blemishCount;
    data['grade'] = grade;
    data['count'] = count;
    return data;
  }
}