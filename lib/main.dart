import 'package:flutter/material.dart';
import 'package:flutter_application_6/controller/TaskController.dart';
import 'package:flutter_application_6/view/pages/ListTaskPage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskController()),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Lista de Tareas"),
        ),
        body: ListTaskPage(),
      ),
    );
  }
}
