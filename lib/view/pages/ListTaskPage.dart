import 'package:flutter/material.dart';
import 'package:flutter_application_6/controller/TaskController.dart';
import 'package:flutter_application_6/model/Tasks.dart';
import 'package:flutter_application_6/view/pages/CreateTaskPage.dart';
import 'package:flutter_application_6/view/widgets/AppBarTask.dart';
import 'package:provider/provider.dart';

class ListTaskPage  extends StatefulWidget{
  @override
  State<ListTaskPage> createState() => _ListTaskPageState();
}

class _ListTaskPageState extends State<ListTaskPage> {
  String title = "Lista de Tareas";
  Map<String, dynamic> values = {
    'allow': false,
  };

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
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        Tasks task = tasks[index];
        return ListTile(
          title: Text(task.name),
          subtitle: Text(task.description),
          trailing: Checkbox(
            value: values['allow'],
            onChanged: (newValue) {
              setState(() {
                values['allow'] = newValue;
              });
            },
          ),
          leading: IconButton(
            onPressed: () => taskController.removeTask(task),
            icon: const Icon(Icons.delete),
          ),
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