import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

/// Filteroptionen für die To-do-Liste.
enum TodoFilter { all, open, done }

/// Provider zur Verwaltung der To-do-Liste und des Filters.
///
/// Kümmert sich um Laden, Speichern, Hinzufügen, Entfernen,
/// Statuswechsel und Filterung der Aufgaben.
class TodoProvider extends ChangeNotifier {
  // Interne Liste aller Todos.
  List<Todo> _todos = [];

  // Aktueller Filter (alle, offen, erledigt).
  TodoFilter _filter = TodoFilter.all;

  // Gibt die Liste der Todos zurück, gefiltert nach dem aktuellen Filter.
  List<Todo> get todos {
    switch (_filter) {
      case TodoFilter.open:
        return _todos.where((t) => !t.isDone).toList();
      case TodoFilter.done:
        return _todos.where((t) => t.isDone).toList();
      case TodoFilter.all:
        return _todos;
    }
  }

  // Aktueller Filter.
  TodoFilter get filter => _filter;

  // Lädt gespeicherte Todos und Filter aus SharedPreferences.
  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final todoList = prefs.getStringList('todos') ?? [];
    _todos = todoList.map((e) => Todo.fromJson(e)).toList();
    _filter = TodoFilter.values[prefs.getInt('filter') ?? 0];
    notifyListeners();
  }

  // Speichert aktuelle Todos und Filter in SharedPreferences.
  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', _todos.map((e) => e.toJson()).toList());
    await prefs.setInt('filter', _filter.index);
  }

  // Fügt eine neue Aufgabe hinzu, speichert und benachrichtigt Listener.
  void addTodo(Todo todo) {
    _todos.add(todo);
    saveToPrefs();
    notifyListeners();
  }

  // Entfernt eine Aufgabe per ID, speichert und benachrichtigt Listener.
  void removeTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
    saveToPrefs();
    notifyListeners();
  }

  // Wechselt den Erledigt-Status einer Aufgabe per ID.
  void toggleTodo(String id) {
    final idx = _todos.indexWhere((t) => t.id == id);
    if (idx != -1) {
      _todos[idx].isDone = !_todos[idx].isDone;
      saveToPrefs();
      notifyListeners();
    }
  }

  // Setzt den aktuellen Filter, speichert und benachrichtigt Listener.
  void setFilter(TodoFilter filter) {
    _filter = filter;
    saveToPrefs();
    notifyListeners();
  }
}
