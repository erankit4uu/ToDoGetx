import 'package:to_do_getx_tut/app/data/models/Tasks.dart';
import 'package:to_do_getx_tut/app/data/providers/task_provider.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Tasks> getTasks() => taskProvider.getTasks();

  void addTask(List<Tasks> tasks) => taskProvider.addTask(tasks);
}