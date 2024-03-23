import 'package:flutter/material.dart';
import 'package:flutter_application_6/controller/TaskController.dart';
import 'package:provider/provider.dart';

PreferredSizeWidget AppBarTask(String title) {
  return AppBar(
    title: Consumer<TaskController>(
      builder: (context, taskController, child) {
        return Text(
          "$title ${taskController.tasks.length}",
          style: const TextStyle(color: Colors.white),
        );
      }
    ),
  );
}