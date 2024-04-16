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
}