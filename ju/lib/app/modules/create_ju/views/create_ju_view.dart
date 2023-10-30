import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                  icon: Icon(Icons.account_balance_wallet_outlined)
              ),
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
                  style: const TextStyle(color: Color.fromRGBO(135, 206, 250, 1)),
                  decoration: const InputDecoration(
                      labelText: "男生",
                      hintText: "0",
                      icon: Icon(Icons.boy_outlined, color: Color.fromRGBO(135, 206, 250, 1))
                  ),
                  validator: (v) => v!.trim().isNotEmpty ? null : "想一个男生人数吧～",
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
                  style: const TextStyle(color: Color.fromRGBO(255, 184, 198, 1)),
                  decoration: const InputDecoration(
                      labelText: "女生",
                      hintText: "0",
                      icon: Icon(Icons.girl_outlined, color: Color.fromRGBO(255, 184, 198, 1))
                  ),
                  validator: (v) => v!.trim().isNotEmpty ? null : "想一个女生人数吧～",
                ),
                )
              ],
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
