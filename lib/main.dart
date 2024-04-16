import 'package:flutter/material.dart';
import 'package:flutter_application_6/controller/TaskController.dart';
import 'package:flutter_application_6/view/pages/ListTaskPage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TaskController()),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  String title = "Tareas";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListTaskPage(),
      ),
    );
  }
}
