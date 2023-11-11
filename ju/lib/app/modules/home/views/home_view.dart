import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.ac_unit, color: Colors.white,),
          onPressed: null,
        ),
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
                  child: const Icon(Icons.search,color: Colors.black54),
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
            icon: Icon(Icons.category_outlined, color: Colors.white,),
            onPressed: null,
          )
        ],
        bottom: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            controller: controller.tabController,
            tabs: const [
              Tab(child: Text("剧本杀")),
              Tab(child: Text("密室逃脱")),
              Tab(child: Text("公园躲猫猫")),
              Tab(child: Text("干一杯")),
              Tab(child: Text("待补充")),
            ]
        ),
      ),
      body: TabBarView(
          controller: controller.tabController,
          children: [
            ListView(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w)
                  ),
                  elevation: 10,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("窗边的女人", style: TextStyle(fontSize: 70.sp)),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0), child: Wrap(
                        spacing: 20.w,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Text("新手局", style: TextStyle(color: Colors.black54)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Text("需要验证", style: TextStyle(color: Colors.black54)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Text("本格", style: TextStyle(color: Colors.black54)),
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Text("恐怖", style: TextStyle(color: Colors.black54)),
                          ),
                        ],
                      )),
                      const Divider(),
                      Padding(padding: const EdgeInsets.fromLTRB(10, 0, 10, 0), child: Text("ababababababa...", style: TextStyle(fontSize: 50.sp),)),
                      const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.girl_outlined, color: Color.fromRGBO(255, 184, 198, 1)),
                          Text("2/3"),
                          Icon(Icons.boy_outlined, color: Color.fromRGBO(135, 206, 250, 1)),
                          Text("3/3"),
                        ],
                      ),)
                    ],
                  ),
                )
              ]
            ),
            const ListTile(
              title: Text("密室逃脱脱脱"),
            ),
            const ListTile(
              title: Text("公园躲猫猫"),
            ),
            const ListTile(
              title: Text("干一杯杯杯"),
            ),
            const ListTile(
              title: Text("待补充"),
            ),
          ]
      ),
      bottomNavigationBar: Obx(() => BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                icon: Icon(Icons.home_max_outlined, color: controller.bottomNaviSelected.value == 0 ? const Color.fromRGBO(100, 215, 100, 1) : null),
                onPressed: () {
                  controller.bottomNaviSelected.value = 0;
                  Get.toNamed("/home");
                }
            ),
            IconButton(
                icon: Icon(Icons.spa_outlined, color: controller.bottomNaviSelected.value == 1 ? const Color.fromRGBO(100, 215, 100, 1) : null),
                onPressed: () {
                  controller.bottomNaviSelected.value = 1;
                  Get.toNamed("/home");
                }
            ),
            const Text(""),
            IconButton(
                icon: Icon(Icons.add_alarm_outlined, color: controller.bottomNaviSelected.value == 2 ? const Color.fromRGBO(100, 215, 100, 1) : null),
                onPressed: () {
                  controller.bottomNaviSelected.value = 2;
                  Get.toNamed("/home");
                }
            ),
            IconButton(
                icon: Icon(Icons.account_circle_outlined, color: controller.bottomNaviSelected.value == 3 ? const Color.fromRGBO(100, 215, 100, 1) : null),
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
          borderRadius: BorderRadius.circular(30)
        ),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.toNamed("/create-ju");
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
