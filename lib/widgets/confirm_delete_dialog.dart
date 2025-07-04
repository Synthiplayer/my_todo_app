import 'package:flutter/material.dart';
import '../ui/colors.dart';

/// Bestätigungsdialog für das Löschen einer Aufgabe.
///
class ConfirmDeleteDialog extends StatelessWidget {
  // Titel des Dialogs, standardmäßig 'Aufgabe löschen'
  final String title;

  // Inhaltstext des Dialogs
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
        // Button zum Abbrechen, gibt false zurück
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Abbrechen'),
        ),
        // Bestätigungsbutton zum Löschen, gibt true zurück
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
