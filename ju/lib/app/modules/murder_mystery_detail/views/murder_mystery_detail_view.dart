import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/murder_mystery_detail_controller.dart';

class MurderMysteryDetailView extends GetView<MurderMysteryDetailController> {
  const MurderMysteryDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('窗边的女人'),
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
                        title: Text("wyz"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 50.w),
                      child: Text("2023-01-01 13:00 ~ 2023-01-01 19:00"),
                    )
                  ],
                ),
                Divider(),
                Padding(padding: EdgeInsets.all(50.sp), child: Text("dlsajdiosadadjaiodsadksaodmvokjvaoivjsiaovduaovuavioauvdoiaduvoiavuaiovuaiov",
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
                            children: [
                              ListTile(
                                leading: Icon(Icons.headset_mic_outlined),
                                title: Text("wyz"),
                              ),
                              ListTile(
                                leading: Icon(Icons.headset_mic_outlined),
                                title: Text("wyz"),
                              ),
                              ListTile(
                                leading: Icon(Icons.headset_mic_outlined),
                                title: Text("wyz"),
                              ),
                            ]
                        )
                    ),
                    Flexible(
                        flex: 1,
                        child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.headset_mic_outlined),
                                title: Text("wyz"),
                              ),
                              ListTile(
                                leading: Icon(Icons.headset_mic_outlined),
                                title: Text("wyz"),
                              ),
                              ListTile(
                                leading: Icon(Icons.headset_mic_outlined),
                                title: Text("wyz"),
                              ),
                            ]
                        )
                    )
                  ],
                ),
                Divider(),
                Padding(padding: EdgeInsets.only(right: 30.sp), child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
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
    );
  }
}
