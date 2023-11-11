import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

import '../../model/tag.dart';

class CreateJuController extends GetxController {

  GlobalKey createJuKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController boyController = TextEditingController();
  TextEditingController girlController = TextEditingController();
  RxBool filterSwitch = false.obs;

  static List<Tag?> tagsList = [
    Tag(id: 1, tagName: "吃饭",tagType: 1, serviceType: 1),
    Tag(id: 2, tagName: "睡觉",tagType: 1, serviceType: 1),
    Tag(id: 3, tagName: "打呼噜",tagType: 1, serviceType: 1),
  ];

  RxList<Tag?> selectedTags = <Tag?>[].obs;

  final List<MultiSelectItem<Tag?>> items = tagsList
      .map((tag) => MultiSelectItem<Tag>(tag!, tag.tagName!))
      .toList();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
