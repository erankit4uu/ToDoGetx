import 'dart:convert';

import 'package:get/get.dart';
import 'package:to_do_getx_tut/app/core/utils/keys.dart';
import 'package:to_do_getx_tut/app/data/models/Tasks.dart';
import 'package:to_do_getx_tut/app/data/services/storage/services.dart';

class TaskProvider {
  StorageService _storageService = Get.find<StorageService>();

  List<Tasks> getTasks() {
    var task = <Tasks>[];
    jsonDecode(_storageService.read(todoKeys).toString())
        .forEach((e) => task.add(Tasks.fromJson(e)));
    return task;
  }

  void addTask(List<Tasks> tasks){
    _storageService.write(todoKeys, jsonEncode(tasks));
  }
}
