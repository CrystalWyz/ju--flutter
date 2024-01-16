class MurderMysteryUser {

  int? id;
  String? username;
  String? gender;
  int? blemishCount;
  int? grade;
  int? count;

  MurderMysteryUser({this.id, this.username, this.gender, this.blemishCount,this.grade,this.count});

  MurderMysteryUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    gender = json['gender'];
    blemishCount = json['blemishCount'];
    grade = json['grade'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['gender'] = gender;
    data['blemishCount'] = blemishCount;
    data['grade'] = grade;
    data['count'] = count;
    return data;
  }
}