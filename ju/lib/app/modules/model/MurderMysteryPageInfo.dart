class MurderMysteryPageInfo {

  late int id;
  late String imagePath;
  late String title;
  late String subTitle;

  late List<String>? tags;

  late double dist; // 距离
  late int reviews; // 查看数
  late int applies; // 申请数
  late int boyNum;
  late int boyParticipantNum;
  late int girlNum;
  late int girlParticipantNum;

  late String description;


  MurderMysteryPageInfo({required this.id, this.imagePath = '', required this.title, this.subTitle = '',
    this.tags = const [], this.dist = 0.0, this.reviews = 0, this.applies = 0, required this.boyNum, required this.boyParticipantNum,
    required this.girlNum, required this.girlParticipantNum, this.description = ''});

  MurderMysteryPageInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imagePath = json['imagePath']?? 'assets/hotel_4.png';
    title = json['title'];
    subTitle = json['subTitle']?? '';
    tags = List<String>.from(json['tags']);
    dist = json['dist']?? 0.0;
    reviews = json['reviews']?? 0;
    applies = json['applies']?? 0;
    boyNum = json['boyNum'];
    boyParticipantNum = json['boyParticipantNum'];
    girlNum = json['girlNum'];
    girlParticipantNum = json['girlParticipantNum'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['imagePath'] = imagePath;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['tags'] = tags;
    data['dist'] = dist;
    data['reviews'] = reviews;
    data['applies'] = applies;
    data['boyNum'] = boyNum;
    data['description'] = description;
    data['boyParticipantNum'] = boyParticipantNum;
    data['girlNum'] = girlNum;
    data['girlParticipantNum'] = girlParticipantNum;
    return data;
  }
}