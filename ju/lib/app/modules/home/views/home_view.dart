import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: controller.tabController,
          children: [
            Obx(() =>
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      stretch: true,
                      onStretchTrigger: () async {},
                      // flexibleSpace: FlexibleSpaceBar(
                      //   stretchModes: [
                      //     StretchMode.blurBackground,
                      //     StretchMode.fadeTitle,
                      //     StretchMode.zoomBackground
                      //   ],
                      // ),
                      floating: true,
                      leading: Hero(tag: "loginHero",
                          child: const IconButton(
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
                    SliverList(
                        delegate: SliverChildBuilderDelegate(<Widget>(context,
                            index) =>
                            Card(
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
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(controller.pageInfo[index].title!,
                                                style: TextStyle(
                                                    fontSize: 60.sp)),
                                          ),
                                          Padding(padding: EdgeInsets.fromLTRB(
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
                                                        style: TextStyle(
                                                            color: Colors
                                                                .black54)),
                                                  )).toList()
                                          ))
                                        ],
                                      ),
                                      IconButton.filledTonal(
                                          onPressed: () {
                                            Get.toNamed(
                                                "/murder-mystery-detail",
                                                arguments: controller.pageInfo[index].id);
                                          },
                                          icon: Icon(
                                              Icons.arrow_forward_outlined))
                                    ],
                                  ),
                                  const Divider(),
                                  Padding(padding: const EdgeInsets.fromLTRB(
                                      10, 0, 10, 0),
                                      child: Text(controller.pageInfo[index].description!,
                                        style: TextStyle(fontSize: 50.sp),)),
                                  Padding(padding: EdgeInsets.fromLTRB(
                                      10, 0, 10, 0), child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.girl_outlined,
                                          color: Color.fromRGBO(
                                              255, 184, 198, 1)),
                                      Text("${controller.pageInfo[index].girlNum!}/${controller.pageInfo[index]
                                          .girlParticipantNum!}"),
                                      Icon(Icons.boy_outlined,
                                          color: Color.fromRGBO(
                                              135, 206, 250, 1)),
                                      Text("${controller.pageInfo[index].boyNum}/${controller.pageInfo[index]
                                          .boyParticipantNum}"),
                                    ],
                                  ),)
                                ],
                              ),
                            ), childCount: controller.pageInfo.length)
                    ),
                  ],
                )),
            const ListTile(
              title: Text("密室逃脱脱脱"),
            ),
            const ListTile(
              title: Text("躲猫猫"),
            ),
            const ListTile(
              title: Text("干一杯杯杯"),
            )
          ]
      ),
      bottomNavigationBar: Obx(() =>
          BottomAppBar(
            color: ThemeData
                .light()
                .appBarTheme
                .foregroundColor,
            shape: const CircularNotchedRectangle(),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(Icons.home_max_outlined,
                        color: controller.bottomNaviSelected.value == 0
                            ? Theme.of(context).primaryColorDark
                            : null),
                    onPressed: () {
                      controller.bottomNaviSelected.value = 0;
                      Get.toNamed("/home");
                    }
                ),
                IconButton(
                    icon: Icon(Icons.spa_outlined,
                        color: controller.bottomNaviSelected.value == 1
                            ? Theme.of(context).primaryColorDark
                            : null),
                    onPressed: () {
                      controller.bottomNaviSelected.value = 1;
                      Get.toNamed("/home");
                    }
                ),
                const Text(""),
                IconButton(
                    icon: Icon(Icons.add_alarm_outlined,
                        color: controller.bottomNaviSelected.value == 2
                            ? Theme.of(context).primaryColorDark
                            : null),
                    onPressed: () {
                      controller.bottomNaviSelected.value = 2;
                      Get.toNamed("/home");
                    }
                ),
                IconButton(
                    icon: Icon(Icons.account_circle_outlined,
                        color: controller.bottomNaviSelected.value == 3
                            ? Theme.of(context).primaryColorDark
                            : null),
                    onPressed: () {
                      controller.bottomNaviSelected.value = 3;
                      Get.toNamed("/home");
                    }
                ),
              ],
            ),
          )),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
        height: 175.w,
        width: 175.w,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(87.5)
        ),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          shape: CircleBorder(),
          onPressed: () {
            Get.toNamed("/create-ju");
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
