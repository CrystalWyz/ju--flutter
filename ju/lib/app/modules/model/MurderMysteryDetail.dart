import 'MurderMysteryUser.dart';

class MurderMysteryDetail {

  int? id;
  String? title;
  DateTime? beginExpected;
  DateTime? finishExpected;
  String? description;
  int? status;
  int? boyNum;
  List<MurderMysteryUser>? boyParticipants;
  int? girlNum;
  List<MurderMysteryUser>? girlParticipants;
  List<String>? area;
  String? address;
  String? shopName;
  List<String>? tags;
  Map<String, dynamic>? config;

  MurderMysteryDetail({this.id, this.title, this.beginExpected, this.finishExpected, this.description,this.status, this.boyNum, this.boyParticipants,
  this.girlNum, this.girlParticipants, this.area, this.address, this.shopName, this.tags, this.config});

  MurderMysteryDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    beginExpected = json['beginExpected'];
    finishExpected = json['finishExpected'];
    description = json['description'];
    status = json['status'];
    boyNum = json['boyNum'];
    boyParticipants = json['boyParticipants'];
    girlNum = json['girlNum'];
    girlParticipants = json['girlParticipants'];
    area = json['area'];
    address = json['address'];
    shopName = json['shopName'];
    tags = json['tags'];
    config = json['config'];
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
    return data;
  }
}