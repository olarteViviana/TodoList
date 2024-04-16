import 'package:cloud_firestore/cloud_firestore.dart';
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
    TaskController provider = Provider.of<TaskController>(context);
    return Scaffold(
      appBar: AppBarTask(title: "Lista de Tareas"),
      body: StreamBuilder<QuerySnapshot>(
        stream: provider.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            List<Tasks> tasks = snapshot.data?.docs.map((doc) => Tasks).toList() as List<Tasks>;
            return listTasks(tasks);
          }
        },
      ), 
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => loadCreateTaskPage(context)),
    );
  }

  ListView listTasks(List<Tasks> tasks) {
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
            onPressed: () => tasks.removeAt(index),
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