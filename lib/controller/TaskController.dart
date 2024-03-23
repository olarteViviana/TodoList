import 'package:flutter/foundation.dart';
import 'package:flutter_application_6/model/Tasks.dart';

class TaskController extends ChangeNotifier {
  List<Tasks> _tasks = [];

  List<Tasks> get tasks => _tasks;

  addTask(Tasks tasks) {
    _tasks.add(tasks);
    notifyListeners();
  }

  removeTask(Tasks tasks) {
    _tasks.remove(tasks);
    notifyListeners();
  }
  
}