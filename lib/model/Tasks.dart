import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class Tasks {
  final String name;
  final String description;

  Tasks({required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
    };
  }

  static Tasks fromDocument(DocumentSnapshot doc) {
    return Tasks(
      name: doc['name'],
      description: doc['description'],
    );
  }
}