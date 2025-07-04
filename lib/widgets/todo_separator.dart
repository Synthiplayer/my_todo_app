import 'package:flutter/material.dart';

class TodoSeparator extends StatelessWidget {
  const TodoSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.5,
      color: Colors.grey.shade400, // dezent und passend
    );
  }
}
