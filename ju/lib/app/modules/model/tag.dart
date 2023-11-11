class Tag {

  int? id;
  String? tagName;
  int? tagType;
  int? serviceType;

  Tag({this.id, this.tagName, this.tagType, this.serviceType});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagName = json['tagName'];
    tagType = json['tagType'];
    serviceType = json['serviceType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['tagName'] = tagName;
    data['tagType'] = tagType;
    data['serviceType'] = serviceType;
    return data;
  }
}