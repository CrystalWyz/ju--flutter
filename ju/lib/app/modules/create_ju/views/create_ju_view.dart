import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ju/app/modules/model/tag.dart';
import 'package:ju/app/modules/utils/https_util.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/storage_util.dart';
import '../controllers/create_ju_controller.dart';

class CreateJuView extends GetView<CreateJuController> {
  const CreateJuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('聚一个'),
        centerTitle: true,
      ),
      body: Form(
          key: controller.createJuKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: controller.titleController,
                decoration: const InputDecoration(
                    labelText: "聚主题",
                    hintText: "聚一个!",
                    icon: Icon(Icons.accessibility_new_outlined)),
                validator: (v) => v!.trim().isNotEmpty ? null : "想一个聚名字吧～",
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                  child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "标签",
                    ),
                  ),
                  Expanded(
                    child: MultiSelectBottomSheetField<Tag?>(
                    initialChildSize: 0.7,
                    maxChildSize: 0.95,
                    title: const Text("标签"),
                    buttonText: const Text("标签"),
                    items: controller.items,
                    searchable: true,
                    onConfirm: (values) {
                      controller.selectedTags.value = values;
                    },
                    chipDisplay: MultiSelectChipDisplay(
                      onTap: (item) {
                        controller.selectedTags.remove(item);
                      },
                    ),
                  ))
                ],
              )),
              TextFormField(
                autofocus: false,
                controller: controller.contentController,
                decoration: const InputDecoration(
                    labelText: "描述",
                    hintText: "阿巴阿巴",
                    icon: Icon(Icons.account_balance_wallet_outlined)),
                maxLines: 3,
                validator: (v) => v!.trim().isNotEmpty ? null : "想一个聚描述字吧～",
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      autofocus: false,
                      controller: controller.boyController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      style: const TextStyle(
                          color: Color.fromRGBO(135, 206, 250, 1)),
                      decoration: const InputDecoration(
                          labelText: "男生",
                          hintText: "0",
                          icon: Icon(Icons.boy_outlined,
                              color: Color.fromRGBO(135, 206, 250, 1))),
                      validator: (v) =>
                          v!.trim().isNotEmpty ? null : "想一个男生人数吧～",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      autofocus: false,
                      controller: controller.girlController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 184, 198, 1)),
                      decoration: const InputDecoration(
                          labelText: "女生",
                          hintText: "0",
                          icon: Icon(Icons.girl_outlined,
                              color: Color.fromRGBO(255, 184, 198, 1))),
                      validator: (v) =>
                          v!.trim().isNotEmpty ? null : "想一个女生人数吧～",
                    ),
                  )
                ],
              ),
              Obx(() => Padding(
                  padding: const EdgeInsets.fromLTRB(5, 20, 10, 0),
                  child: OverflowBar(
                    alignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text("审核")),
                      Switch(
                        value: controller.auditSwitch.value,
                        onChanged: (value) {
                          controller.auditSwitch.value = value;
                        },
                      )
                    ],
                  )
              )),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                      child: const Padding(
                          padding: EdgeInsets.all(16), child: Text("冲")),
                      onPressed: () async {
                        var userInfo = await StorageUtil.get("userInfo");
                        if ((controller.createJuKey.currentState as FormState)
                            .validate()) {
                            // 发送请求
                            var response = await HttpsUtil.post("/api/v1/murderMysteries", data: {
                              "title" : controller.titleController.text,
                              "description" : controller.contentController.text,
                              "boyParticipantNum" : controller.boyController.text,
                              "girlParticipantNum" : controller.girlController.text,
                              "config" : {
                                "audit" : controller.auditSwitch.value,
                              }
                            });
                            if(response != null) {
                              // 返回列表页
                              Get.back();
                            }
                          }
                      },
                    ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
