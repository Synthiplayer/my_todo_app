// lib/providers/todo_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo.dart';

enum TodoFilter { all, open, done }

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  TodoFilter _filter = TodoFilter.all;

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

  TodoFilter get filter => _filter;

  Future<void> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final todoList = prefs.getStringList('todos') ?? [];
    _todos = todoList.map((e) => Todo.fromJson(e)).toList();
    _filter = TodoFilter.values[prefs.getInt('filter') ?? 0];
    notifyListeners();
  }

  Future<void> saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', _todos.map((e) => e.toJson()).toList());
    await prefs.setInt('filter', _filter.index);
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    saveToPrefs();
    notifyListeners();
  }

  void removeTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
    saveToPrefs();
    notifyListeners();
  }

  void toggleTodo(String id) {
    final idx = _todos.indexWhere((t) => t.id == id);
    if (idx != -1) {
      _todos[idx].isDone = !_todos[idx].isDone;
      saveToPrefs();
      notifyListeners();
    }
  }

  void setFilter(TodoFilter filter) {
    _filter = filter;
    saveToPrefs();
    notifyListeners();
  }
}
