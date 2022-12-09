import 'package:get/get.dart';
import 'package:to_do_getx_tut/app/data/providers/task_provider.dart';
import 'package:to_do_getx_tut/app/data/services/storage/repository.dart';
import 'package:to_do_getx_tut/app/module/home/controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        HomeController(
          taskRepository: TaskRepository(taskProvider: TaskProvider()),));
  }

}