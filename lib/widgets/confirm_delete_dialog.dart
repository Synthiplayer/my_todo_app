import 'package:flutter/material.dart';

import '../ui/colors.dart';

class ConfirmDeleteDialog extends StatelessWidget {
  final String title;
  final String content;

  const ConfirmDeleteDialog({
    super.key,
    this.title = 'Aufgabe löschen',
    this.content = 'Möchtest du diese Aufgabe wirklich löschen?',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Abbrechen'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDeleteColor,
            foregroundColor: kWhiteColor,
          ),
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Löschen'),
        ),
      ],
    );
  }
}
