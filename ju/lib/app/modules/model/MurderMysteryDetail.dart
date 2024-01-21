import 'MurderMysteryUser.dart';

class MurderMysteryDetail {

  int? id;
  String? title;
  String? beginExpected;
  String? finishExpected;
  String? description;
  String? status;
  int? boyNum;
  List<MurderMysteryUser>? boyParticipants;
  int? girlNum;
  List<MurderMysteryUser>? girlParticipants;
  List<String>? area;
  String? address;
  String? shopName;
  List<String>? tags;
  Map<String, dynamic>? config;
  String? createUsername;

  MurderMysteryDetail({this.id, this.title, this.beginExpected, this.finishExpected, this.description,this.status, this.boyNum, this.boyParticipants = const [],
  this.girlNum, this.girlParticipants = const [], this.area, this.address, this.shopName, this.tags = const [], this.config});

  MurderMysteryDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    beginExpected = json['beginExpected'];
    finishExpected = json['finishExpected'];
    description = json['description'];
    status = json['status'];
    boyNum = json['boyNum'];
    boyParticipants = json['boyParticipants'].map<MurderMysteryUser>((user) => MurderMysteryUser.fromJson(user)).toList();
    girlNum = json['girlNum'];
    girlParticipants = json['girlParticipants'].map<MurderMysteryUser>((user) => MurderMysteryUser.fromJson(user)).toList();
    area = json['area'].map<String>((area) => area.toString()).toList();
    address = json['address'];
    shopName = json['shopName'];
    tags = json['tags'].map<String>((tag) => tag.toString()).toList();
    config = json['config'];
    createUsername = json['createUsername'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['beginExpected'] = beginExpected;
    data['finishExpected'] = finishExpected;
    data['description'] = description;
    data['status'] = status;
    data['boyNum'] = boyNum;
    data['boyParticipants'] = boyParticipants;
    data['girlNum'] = girlNum;
    data['girlParticipants'] = girlParticipants;
    data['area'] = area;
    data['address'] = address;
    data['shopName'] = shopName;
    data['tags'] = tags;
    data['config'] = config;
    data['createUsername'] = createUsername;
    return data;
  }
}