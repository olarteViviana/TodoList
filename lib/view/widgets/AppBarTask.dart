
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_6/controller/TaskController.dart';
import 'package:provider/provider.dart';

class AppBarTask extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  AppBarTask({required this.title});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: StreamBuilder<QuerySnapshot>(
        stream: Provider.of<TaskController>(context, listen: false).getTasks(),
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapShot.hasError) {
            return Text("Error: ${snapShot.error}");
          } else {
            return Text(
              "$title ${snapShot.data!.docs.length}",
              style: const TextStyle(color: Colors.white),
            );
          }
        }
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

