import 'package:flutter/material.dart';
import 'package:flutter_application_6/controller/TaskController.dart';
import 'package:flutter_application_6/model/Tasks.dart';
import 'package:flutter_application_6/view/pages/CreateTaskPage.dart';
import 'package:flutter_application_6/view/widgets/AppBarTask.dart';
import 'package:provider/provider.dart';

class ListTaskPage  extends StatelessWidget{
  String title = "Lista de Tareas";

  @override
  Widget build(BuildContext context) {
    TaskController provider = Provider.of(context);
    return Scaffold(
      appBar: AppBarTask("Lista de Tareas ${provider.tasks.length}"),
      body: Consumer<TaskController>(
        builder: (context, taskController, child) {
          return listTasks(taskController);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => loadCreateTaskPage(context)),
    );
  }

  ListView listTasks(TaskController taskController) {
    List<Tasks> tasks = taskController.tasks;
    Map<String, dynamic> values = {
      'allow': false,
      };
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        Tasks task = tasks[index];
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: [
                Text(task.name),
                Text(task.description),
              ],
            ),
            Checkbox(
              value: values['allow'],
              onChanged: (newValue) {
                values['allow'] = newValue;
              },
            ),
            IconButton(
              onPressed: () => taskController.removeTask(task),
              icon: const Icon(Icons.delete),
            ),
          ],
        );
      },
    ); 
  }

  loadCreateTaskPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CreateTaskPage()
      ),
    );
  }
}