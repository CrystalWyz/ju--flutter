class MurderMysteryPageInfo {

  int? id;
  String? title;
  String? description;
  int? boyNum;
  int? boyParticipantNum;
  int? girlNum;
  int? girlParticipantNum;
  List<String>? tags;

  MurderMysteryPageInfo({this.id, this.title, this.boyNum, this.boyParticipantNum,this.girlNum,this.girlParticipantNum,this.tags});

  MurderMysteryPageInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    boyNum = json['boyNum'];
    boyParticipantNum = json['boyParticipantNum'];
    girlNum = json['girlNum'];
    girlParticipantNum = json['girlParticipantNum'];
    tags = List<String>.from(json['tags']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['boyNum'] = boyNum;
    data['boyParticipantNum'] = boyParticipantNum;
    data['girlNum'] = girlNum;
    data['girlParticipantNum'] = girlParticipantNum;
    data['tags'] = tags;
    return data;
  }
}