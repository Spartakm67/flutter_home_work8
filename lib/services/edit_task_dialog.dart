import 'package:flutter/material.dart';

class EditTaskDialog {
  static Future<String?> showEditDialog(
      BuildContext context, String currentTaskText, int taskNumber,) async {
    final TextEditingController editController =
        TextEditingController(text: currentTaskText);

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: TextField(
            autofocus: true,
            controller: editController,
            decoration: const InputDecoration(
              labelText: 'Task Description',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(null);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final updatedTask = editController.text.trim();
                if (updatedTask.isNotEmpty) {
                  Navigator.of(context).pop(updatedTask);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task description cannot be empty!'),
                    ),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
