import 'package:flutter/material.dart';
import 'package:flutter_home_work8/styles/add_task_dialog_styles.dart';
import 'package:flutter_home_work8/styles/snack_bar_styles.dart';

class EditTaskDialog {
  static Future<String?> showEditDialog(
    BuildContext context,
    String currentTaskText,
    int taskNumber,
  ) async {
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
              hintStyle: AddTaskDialogStyle.hintTextStyle,
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
                      content: Text(
                        'Task description cannot be empty!',
                        style: SnackBarStyle.snackBarTextStyle,
                      ),
                      backgroundColor: SnackBarStyle.backgroundColor,
                      duration: SnackBarStyle.displayDuration,
                    ),
                  );
                }
              },
              child: const Text(
                'Save',
                style: AddTaskDialogStyle.addButtonTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
