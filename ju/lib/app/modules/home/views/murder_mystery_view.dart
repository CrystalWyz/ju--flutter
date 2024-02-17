import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ju/app/modules/home/controllers/home_controller.dart';

class MurderMysteryView extends GetView<HomeController> {

  const MurderMysteryView({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverAppBar(
          stretch: true,
          onStretchTrigger: () async {},
          // flexibleSpace: const FlexibleSpaceBar(
          //   stretchModes: [
          //     StretchMode.blurBackground,
          //     StretchMode.fadeTitle,
          //     StretchMode.zoomBackground
          //   ],
          // ),
          floating: true,
          leading: const Hero(tag: "loginHero",
              child: IconButton(
                icon: Icon(Icons.ac_unit),
                onPressed: null,
              )),
          title: InkWell(
            child: Container(
              width: 800.w,
              height: 96.h,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(246, 246, 246, 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(34.w, 0,
                        10.w, 0),
                    child: const Icon(
                        Icons.search, color: Colors.black54),
                  ),
                  Text("窗边的女人",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 32.sp))
                ],
              ),
            ),
            onTap: () {
              Get.toNamed("/search");
            },
          ),
          centerTitle: true,
          actions: const [
            IconButton(
              icon: Icon(Icons.category_outlined),
              onPressed: null,
            )
          ],
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              controller: controller.tabController,
              tabs: const [
                Tab(child: Text("剧本杀")),
                Tab(child: Text("密室逃脱")),
                Tab(child: Text("躲猫猫")),
                Tab(child: Text("干一杯")),
              ]
          ),
        ),
        Obx(() => SliverList(
            delegate: SliverChildBuilderDelegate(<Widget>(context,
                index) =>
                InkWell(
                  onTap: () {
                    Get.toNamed(
                        "/murder-mystery-detail",
                        arguments: controller.pageInfo[index].id);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.w)
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10, 0, 0, 0),
                                  child: Text(controller.pageInfo[index].title!,
                                      style: TextStyle(
                                          fontSize: 60.sp)),
                                ),
                                Padding(padding: const EdgeInsets.fromLTRB(
                                    10, 0, 0, 0), child: Wrap(
                                    spacing: 20.w,
                                    children: controller.pageInfo[index].tags!.map((tag) =>
                                        Container(
                                          padding: const EdgeInsets
                                              .all(2),
                                          decoration: BoxDecoration(
                                              color: Colors.black12,
                                              borderRadius: BorderRadius
                                                  .circular(10)
                                          ),
                                          child: Text(tag,
                                              style: const TextStyle(
                                                  color: Colors
                                                      .black54)),
                                        )).toList()
                                ))
                              ],
                            ),
                            // IconButton.filledTonal(
                            //     onPressed: () {
                            //       Get.toNamed(
                            //           "/murder-mystery-detail",
                            //           arguments: controller.pageInfo[index].id);
                            //     },
                            //     icon: const Icon(
                            //         Icons.arrow_forward_outlined))
                          ],
                        ),
                        const Divider(),
                        Padding(padding: const EdgeInsets.fromLTRB(
                            10, 0, 10, 0),
                            child: Text(controller.pageInfo[index].description!,
                                style: TextStyle(fontSize: 50.sp),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis)),
                        Padding(padding: const EdgeInsets.fromLTRB(
                            10, 0, 10, 0), child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.girl_outlined,
                                color: Color.fromRGBO(
                                    255, 184, 198, 1)),
                            Text("${controller.pageInfo[index].girlNum!}/${controller.pageInfo[index]
                                .girlParticipantNum!}"),
                            const Icon(Icons.boy_outlined,
                                color: Color.fromRGBO(
                                    135, 206, 250, 1)),
                            Text("${controller.pageInfo[index].boyNum}/${controller.pageInfo[index]
                                .boyParticipantNum}"),
                          ],
                        ),)
                      ],
                    ),
                  ),
                ), childCount: controller.pageInfo.length)
        )),
      ],
    );
  }
}
