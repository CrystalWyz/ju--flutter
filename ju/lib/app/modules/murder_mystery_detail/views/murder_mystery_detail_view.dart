import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ju/app/modules/utils/https_util.dart';

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
          shrinkWrap: true,
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
                          title: Text(
                            "${controller.murderMysteryDetail.value.createUsername}",
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Flexible(
                          child: GridView(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisExtent: 100.h,
                                maxCrossAxisExtent: 150.w,
                              ),
                              children: controller
                                  .murderMysteryDetail.value.tags!
                                  .map((tag) => Container(
                                        margin: EdgeInsets.only(right: 3),
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(50.h)),
                                        child: Center(
                                          child: Text(tag,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.black54)),
                                        ),
                                      ))
                                  .toList())),
                      Container(
                          width: 400.w,
                          child: Column(
                            children: [
                              Text(
                                  "起:${controller.murderMysteryDetail.value.beginExpected}",
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.right),
                              Text(
                                  "结:${controller.murderMysteryDetail.value.finishExpected}",
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.right)
                            ],
                          ))
                    ],
                  ),
                  Divider(),
                  Padding(
                      padding: EdgeInsets.all(50.sp),
                      child: Text(
                        "${controller.murderMysteryDetail.value.description}",
                        style: TextStyle(fontSize: 60.sp),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Divider(),
                  Row(children: [
                    Flexible(
                        flex: 1,
                        child: Column(
                            children: controller
                                .murderMysteryDetail.value.boyParticipants!
                                .map<Widget>((user) => Container(
                                      child: Row(
                                        children: [
                                          Flexible(
                                              child: ListTile(
                                            leading: Icon(
                                                Icons.headset_mic_outlined),
                                            title: Text("${user.username}"),
                                          )),
                                          Column(
                                            children: [
                                              Text("等级: ${user.grade ?? 0}",
                                                  style:
                                                      TextStyle(fontSize: 10)),
                                              Text("次数: ${user.count ?? 0}",
                                                  style:
                                                      TextStyle(fontSize: 10)),
                                              Text(
                                                  "污点: ${user.blemishCount ?? 0}",
                                                  style:
                                                      TextStyle(fontSize: 10)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ))
                                .toList())),
                    Flexible(
                      flex: 1,
                      child: Padding(
                          padding: EdgeInsets.only(right: 20.w),
                          child: Column(
                              children: controller
                                  .murderMysteryDetail.value.girlParticipants!
                                  .map<Widget>((user) => Container(
                                        child: Row(
                                          children: [
                                            Flexible(
                                                child: ListTile(
                                              leading: Icon(
                                                  Icons.headset_mic_outlined),
                                              title: Text("${user.username}"),
                                            )),
                                            Column(
                                              children: [
                                                Text("等级: ${user.grade ?? 0}",
                                                    style: TextStyle(
                                                        fontSize: 10)),
                                                Text("次数: ${user.count ?? 0}",
                                                    style: TextStyle(
                                                        fontSize: 10)),
                                                Text(
                                                    "污点: ${user.blemishCount ?? 0}",
                                                    style: TextStyle(
                                                        fontSize: 10)),
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                  .toList())),
                    )
                  ]),
                  Divider(),
                  Padding(
                      padding: EdgeInsets.only(right: 30.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                HttpsUtil.patch(
                                    "/api/v1/murderMysteries/join/${Get.arguments}");
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 2.0,
                              ),
                              child: const Text('加入'))
                        ],
                      )),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            )
          ],
        )));
  }
}
