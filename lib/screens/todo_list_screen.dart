import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../models/todo.dart';
import 'dart:math';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    // Lade gespeicherte Todos und Filter nach dem ersten Frame (BuildContext safe)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoProvider>(context, listen: false).loadFromPrefs();
    });
  }

  void _addTodoDialog(BuildContext context) async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Neue Aufgabe'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Titel eingeben'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Abbrechen'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                Navigator.of(ctx).pop(controller.text.trim());
              }
            },
            child: const Text('Hinzufügen'),
          ),
        ],
      ),
    );

    // Nach dem Dialog: Kontext ist sicher!
    if (result != null && context.mounted) {
      Provider.of<TodoProvider>(context, listen: false).addTodo(
        Todo(
          id:
              DateTime.now().millisecondsSinceEpoch.toString() +
              Random().nextInt(10000).toString(),
          title: result,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todos;

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do App'),
        actions: [
          PopupMenuButton<TodoFilter>(
            initialValue: provider.filter,
            onSelected: (f) => provider.setFilter(f),
            itemBuilder: (context) => [
              const PopupMenuItem(value: TodoFilter.all, child: Text('Alle')),
              const PopupMenuItem(value: TodoFilter.open, child: Text('Offen')),
              const PopupMenuItem(
                value: TodoFilter.done,
                child: Text('Erledigt'),
              ),
            ],
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
      body: todos.isEmpty
          ? const Center(child: Text('Keine Aufgaben'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (ctx, i) {
                final todo = todos[i];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (_) => provider.toggleTodo(todo.id),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isDone
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => provider.removeTodo(todo.id),
                  ),
                  onTap: () => provider.toggleTodo(todo.id),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodoDialog(context),
        tooltip: 'Aufgabe hinzufügen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
