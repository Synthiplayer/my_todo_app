import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../models/todo.dart';
import 'dart:math';

import '../ui/colors.dart';
import '../widgets/confirm_delete_dialog.dart';
import '../widgets/todo_separator.dart'; // Import des Separator-Widgets

/// Bildschirm mit der Liste der To-do-Aufgaben.
///
/// Zeigt Aufgaben nach Filter sortiert an, ermöglicht hinzufügen, löschen und Statuswechsel.
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

  // Zeigt einen Dialog zum Hinzufügen einer neuen Aufgabe an.
  void _addTodoDialog(BuildContext context) async {
    final controller = TextEditingController();

    // Eingabedialog mit Textfeld und Buttons
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

    // Wenn der Nutzer einen Text eingab und der Kontext noch aktiv ist
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
          : ListView.separated(
              itemCount: todos.length,
              itemBuilder: (ctx, i) {
                final todo = todos[i];
                // Hintergrundfarbe alternierend für bessere Lesbarkeit
                final bgColor = (i % 2 == 0) ? listBgColor1 : listBgColor2;

                return Container(
                  color: bgColor,
                  child: ListTile(
                    leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (_) => provider.toggleTodo(todo.id),
                    ),
                    title: Text(
                      todo.title,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        decoration: todo.isDone
                            ? TextDecoration.lineThrough
                            : null,
                        decorationThickness: todo.isDone ? 3.0 : null,
                        color: todo.isDone ? Colors.grey : Colors.black87,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_forever_rounded,
                        color: kDeleteColor,
                      ),
                      onPressed: () async {
                        // Bestätigungsdialog vor Löschen
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (_) => const ConfirmDeleteDialog(),
                        );
                        if (confirmed == true) {
                          provider.removeTodo(todo.id);
                        }
                      },
                      tooltip: 'Löschen',
                    ),
                    // Tippen toggelt den Status (offen / erledigt)
                    onTap: () => provider.toggleTodo(todo.id),
                  ),
                );
              },
              separatorBuilder: (ctx, i) => const TodoSeparator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTodoDialog(context),
        tooltip: 'Aufgabe hinzufügen',
        child: const Icon(Icons.add),
      ),
    );
  }
}
