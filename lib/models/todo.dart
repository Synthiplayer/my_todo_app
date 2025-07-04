import 'dart:convert';

/// Modellklasse für eine einzelne To-do-Aufgabe.
class Todo {
  // Eindeutige ID der Aufgabe.
  final String id;

  // Titel/Beschreibung der Aufgabe.
  final String title;

  // Status der Aufgabe: true = erledigt, false = offen.
  bool isDone;

  // Konstruktor zur Initialisierung einer Aufgabe.
  // isDone ist standardmäßig false (offen).
  Todo({required this.id, required this.title, this.isDone = false});

  // Konvertiert das Objekt in eine Map, um es zu speichern.
  Map<String, dynamic> toMap() => {'id': id, 'title': title, 'isDone': isDone};

  // Erzeugt eine Instanz von To-do aus einer Map (z. B. aus Persistenz).
  factory Todo.fromMap(Map<String, dynamic> map) => Todo(
    id: map['id'] as String,
    title: map['title'] as String,
    isDone: map['isDone'] as bool,
  );

  // Serialisiert das Objekt als JSON-String.
  String toJson() => jsonEncode(toMap());

  // Deserialisiert eine JSON-String-Repräsentation zu einer To-do-Instanz.
  factory Todo.fromJson(String source) =>
      Todo.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
