import 'package:flutter/material.dart';
import 'package:flutter_application_6/controller/TaskController.dart';
import 'package:flutter_application_6/model/Tasks.dart';

String? validatorName(String? name) {
  if (name == null || name!.isEmpty) {
    return "El nombre es obligatorio";
  }
  return null;
}

String? validatorDescription(String? description) {
  if (description == null || description!.isEmpty) {
    return "La descripción es obligatorio";
  }
  return null;
}

saveTask(GlobalKey<FormState> _key,
    {required String? name, required String? description, required TaskController provider}) {

  if (_key.currentState!.validate()) {
    _key.currentState!.save();
    if (name != null && description != null) {
      print(name);
      Tasks tasks = Tasks(name: name, description: description);
      provider.addTask(tasks);
    }
  }
}