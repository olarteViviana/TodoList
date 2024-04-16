import 'package:flutter/material.dart';
import 'package:flutter_application_6/model/Tasks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskController extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;

  final String collection = "tasks";

  Future<String> create(Map<String, dynamic> task) async {
    try {
      DocumentReference response = await db.collection(collection).add(task);
      return response.id;
    } catch (e) {
      print(e);
      return "";
    }
  }

  Stream<QuerySnapshot> getTasks() {
    return db.collection(collection).snapshots();
  }
  
}