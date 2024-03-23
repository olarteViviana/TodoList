import 'package:flutter/material.dart';
import 'package:flutter_application_6/controller/CreateTaskController.dart';
import 'package:flutter_application_6/controller/TaskController.dart';
import 'package:flutter_application_6/view/widgets/AppBarTask.dart';
import 'package:provider/provider.dart';

class CreateTaskPage extends StatefulWidget {
  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();  
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  GlobalKey<FormState> _key = GlobalKey();

  String? name = "";
  String? description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTask("Nueva Tarea"),
      body: Consumer<TaskController>(
        builder: (context, taskController, child) => 
          taskForm(taskController),
      ),
    );
  }

  Form taskForm(TaskController taskController) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (newValue) => name = newValue,
              validator: validatorName,
              decoration: const InputDecoration(
                labelText: "Nombre", hintText: "Ingrese el nombre de la tarea"),
            ),
            TextFormField(
              onChanged: (newValue) => description = newValue,
              validator: validatorDescription,
              decoration: const InputDecoration(
                labelText: "Descripción",
                hintText: "Ingrese la descripción de la tarea"),
            ),
            TextButton(
              onPressed: () => 
                saveTask(
                  _key,
                  name: name,
                  description: description,
                  provider: taskController
                ),
                child: const Text("Guargar Tarea"),
            ),
          ],
        ),
      ),
    );
  }
}