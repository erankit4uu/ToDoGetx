import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:to_do_getx_tut/app/core/utils/extentions.dart';
import 'package:to_do_getx_tut/app/core/values/color.dart';
import 'package:to_do_getx_tut/app/data/models/Tasks.dart';
import 'package:to_do_getx_tut/app/module/home/controller.dart';

import '../../../widgets/icons.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Tasks tasks;

  TaskCard({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    final color = HexColor.fromHex(tasks.color);
    var squareWidth = Get.width - 12.0.wp;

    return Container(
        width: squareWidth / 2,
        height: squareWidth / 2,
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(color: dialogBack, boxShadow: [
          BoxShadow(
            color: Colors.grey[300]!,
            blurRadius: 7,
            offset: const Offset(0, 7),
          )
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepProgressIndicator(
              totalSteps: 100,
              currentStep: 80,
              size: 5,
              padding: 0,
              selectedGradientColor: LinearGradient(
                  colors: [color.withOpacity(0.5), color],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              unselectedGradientColor: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                IconData(tasks.icon, fontFamily: 'MaterialIcons'),
                color: color,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(tasks.title,  style: TextStyle(
                        fontSize: 12.0.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 2.0.wp,
                    ),
                    Text(
                      "${tasks.todos?.length ?? 0} task",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
          ],
        ));
  }
}
