import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/theme.dart';
import 'package:provider/provider.dart';
import 'providers/todo_provider.dart';
import 'screens/todo_list_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TodoProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To-do App',
        theme: appTheme,
        home: const TodoListScreen(),
      ),
    );
  }
}
