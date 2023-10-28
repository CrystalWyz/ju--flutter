import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_ju_controller.dart';

class CreateJuView extends GetView<CreateJuController> {
  const CreateJuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateJuView'),
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
                icon: Icon(Icons.accessibility_new_outlined)
              ),
              validator: (v) => v!.trim().isNotEmpty ? null : "想一个聚名字吧～",
            ),
            TextFormField(
              autofocus: false,
              controller: controller.contentController,
              decoration: const InputDecoration(
                  labelText: "描述",
                  hintText: "阿巴阿巴",
                  icon: Icon(Icons.accessibility_new_outlined)
              ),
              maxLines: 3,
              validator: (v) => v!.trim().isNotEmpty ? null : "想一个聚描述字吧～",
            ),
            Padding(
                padding: const EdgeInsets.only(top: 26),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text("冲")
                          ),
                          onPressed: () => {
                            if((controller.createJuKey.currentState as FormState).validate()) {
                              // TODO 发送请求
                            }
                          },
                        )
                    )
                  ],
                ),
            )
          ],
        )
      ),
    );
  }
}
