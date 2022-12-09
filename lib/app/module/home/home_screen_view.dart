import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_getx_tut/app/data/models/Tasks.dart';
import 'package:to_do_getx_tut/app/module/home/binding.dart';
import 'package:to_do_getx_tut/app/module/home/controller.dart';
import 'package:to_do_getx_tut/app/core/utils/extentions.dart';
import 'package:to_do_getx_tut/app/module/home/widgets/add_card.dart';
import 'package:to_do_getx_tut/app/module/home/widgets/task_card.dart';

class HomeScreenView extends GetView<HomeController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(4.0.wp),
              child: Text(
                "Tasks",
                style: TextStyle(color: Colors.black87, fontSize: 20.0.sp),
              )),
          Obx(() => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.task.map((element) => TaskCard(tasks: element)),
                  AddCard()
                ],
              ))
        ],
      ),
    ));
  }
}
