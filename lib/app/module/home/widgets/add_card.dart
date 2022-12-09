import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_do_getx_tut/app/core/utils/extentions.dart';
import 'package:to_do_getx_tut/app/core/values/color.dart';
import 'package:to_do_getx_tut/app/data/models/Tasks.dart';
import 'package:to_do_getx_tut/app/module/home/controller.dart';
import 'package:to_do_getx_tut/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
              title: "Add Task",
              backgroundColor: dialogBack,
              radius: 5,
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              content: Form(
                key: homeCtrl.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: homeCtrl.dialogTitleCtrl,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), labelText: "Title"),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter the text title";
                        }
                        return null;
                      },
                    ),
                    Wrap(
                      spacing: 2.0.wp,
                      children: icons
                          .map((e) => Obx(() {
                                final index = icons.indexOf(e);
                                return ChoiceChip(
                                  label: e,
                                  selected: homeCtrl.chipIndex.value == index,
                                  onSelected: (bool selected) {
                                    homeCtrl.chipIndex.value =
                                        selected ? index : 0;
                                  },
                                );
                              }))
                          .toList(),
                    ),
                    ElevatedButton(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0.sp),
                      ),
                      onPressed: () {
                        if(homeCtrl.formKey.currentState!.validate()){
                          int icon = icons[homeCtrl.chipIndex.value].icon!.codePoint;
                          String color = icons[homeCtrl.chipIndex.value].color!.toHex();
                          var task = Tasks(title: homeCtrl.dialogTitleCtrl.text, icon: icon, color: color);
                          Get.back();
                          homeCtrl.addTask(task)?
                          EasyLoading.showSuccess("Task Added"):
                          EasyLoading.showError("Error Occurred");
                        }
                      },
                    )
                  ],
                ),
              ));
          homeCtrl.dialogTitleCtrl.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: const [8, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 10.0.wp,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
