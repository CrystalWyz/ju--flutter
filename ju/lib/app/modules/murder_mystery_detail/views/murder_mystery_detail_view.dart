import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ju/app/modules/model/MurderMysteryUser.dart';

import '../controllers/murder_mystery_detail_controller.dart';

class MurderMysteryDetailView extends GetView<MurderMysteryDetailController> {
  const MurderMysteryDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text("${controller.murderMysteryDetail.value.title}"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.w),
                        width: 350.w,
                        child: ListTile(
                          leading: Icon(Icons.headset_mic_outlined),
                          title: Text("${controller.murderMysteryDetail.value.createUsername}"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 50.w),
                        child: Text("${controller.murderMysteryDetail.value.beginExpected} ~ ${controller.murderMysteryDetail.value.finishExpected}"),
                      )
                    ],
                  ),
                  Divider(),
                  Padding(padding: EdgeInsets.all(50.sp), child: Text("${controller.murderMysteryDetail.value.description}",
                    style: TextStyle(
                        fontSize: 60.sp
                    ),
                  )),
                  Divider(),
                  Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Column(
                                children: controller.murderMysteryDetail.value.boyParticipants!.map<Widget>((user) => ListTile(
                                  leading: Icon(Icons.headset_mic_outlined),
                                  title: Text("${user.username}"),
                                )).toList()
                            )
                        ),
                        Flexible(
                            flex: 1,
                            child: Column(
                                children: controller.murderMysteryDetail.value.girlParticipants!.map<Widget>((user) => ListTile(
                                  leading: Icon(Icons.headset_mic_outlined),
                                  title: Text("${user.username}"),
                                )).toList()
                            )
                        )
                      ]),
                  Divider(),
                  Padding(padding: EdgeInsets.only(right: 30.sp), child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 2.0,
                          ),
                          child: const Text('加入'))
                    ],
                  ))
                ],
              ),
            )
          ],
        )
    ));
  }
}
