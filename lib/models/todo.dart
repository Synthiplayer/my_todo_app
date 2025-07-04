// lib/models/todo.dart
import 'dart:convert';

class Todo {
  final String id;
  final String title;
  bool isDone;

  Todo({required this.id, required this.title, this.isDone = false});

  // Für Persistenz: toMap und fromMap
  Map<String, dynamic> toMap() => {'id': id, 'title': title, 'isDone': isDone};

  factory Todo.fromMap(Map<String, dynamic> map) => Todo(
    id: map['id'] as String,
    title: map['title'] as String,
    isDone: map['isDone'] as bool,
  );

  String toJson() => jsonEncode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(jsonDecode(source));
}
