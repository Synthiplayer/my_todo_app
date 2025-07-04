import 'package:flutter/material.dart';

/// Trennlinie zwischen einzelnen To-do-Elementen in der Liste.
///
class TodoSeparator extends StatelessWidget {
  const TodoSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.5,
      color: Colors.grey.shade400, // dezenter, passender Farbton
    );
  }
}
