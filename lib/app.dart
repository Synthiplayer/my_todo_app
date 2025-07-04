import 'package:flutter/material.dart';
import 'package:hollyday_todos/ui/theme.dart';
import 'package:provider/provider.dart';
import 'providers/todo_provider.dart';
import 'screens/todo_list_screen.dart';

/// Root-Widget der App.
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Provider für To-do-Daten verfügbar machen
      providers: [ChangeNotifierProvider(create: (_) => TodoProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Debug-Banner ausblenden
        title: 'To-do App',
        theme: appTheme, // Eigenes Theme verwenden
        home: const TodoListScreen(), // Startbildschirm
      ),
    );
  }
}
