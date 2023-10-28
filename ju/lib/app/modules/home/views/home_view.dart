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
        leading: IconButton(
          icon: const Icon(Icons.ac_unit, color: Colors.white,),
          onPressed: null,
        ),
        title: const Text('聚'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined, color: Colors.white,),
            onPressed: null,
          )
        ],
        bottom: TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            controller: controller.tabController,
            tabs: [
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
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("新手局", style: TextStyle(color: Colors.black54)),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("需要验证", style: TextStyle(color: Colors.black54)),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("本格", style: TextStyle(color: Colors.black54)),
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("恐怖", style: TextStyle(color: Colors.black54)),
                          ),
                        ],
                      )),
                      Divider(),
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Text("ababababababaababababababaababababababaababababababaababababababa...", style: TextStyle(fontSize: 50.sp),)),
                      Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Row(
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
            ListTile(
              title: Text("密室逃脱脱脱"),
            ),
            ListTile(
              title: Text("公园躲猫猫"),
            ),
            ListTile(
              title: Text("干一杯杯杯"),
            ),
            ListTile(
              title: Text("待补充"),
            ),
          ]
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromRGBO(100, 215, 200, 1),
        currentIndex: controller.bottomNaviSelected.value,
        onTap: (selectedIndex) => controller.changeBottomNaviSelect(selectedIndex),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_max_outlined),
              label: "首页"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.spa_outlined),
              label: "待定"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: "聚一个"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_alarm_outlined),
              label: "消息"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "我的"
          ),
        ],
      )),
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
        height: 175.w,
        width: 175.w,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {

          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
