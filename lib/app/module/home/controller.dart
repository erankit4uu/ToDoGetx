import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do_getx_tut/app/data/services/storage/repository.dart';

import '../../data/models/Tasks.dart';

class HomeController extends GetxController{
  TaskRepository taskRepository;

  final task = <Tasks>[].obs;

  HomeController({required this.taskRepository});

  final formKey = GlobalKey<FormState>();
  final dialogTitleCtrl = TextEditingController();
  final chipIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    task.assignAll(taskRepository.getTasks());
    ever(task, (_) => taskRepository.addTask(task));
  }

  @override
  void onClose() {
    super.onClose();
  }
  void changeChipIndex(int index){
    chipIndex.value = index;
  }

  bool addTask(Tasks tasks){
    if(task.contains(tasks)){
      return false;
    }
    task.add(tasks);
    return true;
  }
}