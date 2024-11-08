import 'package:flutter/material.dart';
import 'package:flutter_home_work8/styles/add_task_dialog_styles.dart';
import 'package:flutter_home_work8/styles/snack_bar_styles.dart';

class AddTaskDialog {
  static Future<void> show(
    BuildContext context,
    Function(String) onAdd,
  ) async {
    final TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add New Task',
            style: AddTaskDialogStyle.titleTextStyle,
          ),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(
              hintText: 'Enter task description',
              hintStyle: AddTaskDialogStyle.hintTextStyle,
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () {
                taskController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newTask = taskController.text.trim();
                if (newTask.isNotEmpty) {
                  onAdd(newTask);
                  taskController.clear();
                  Navigator.of(context).pop();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Text field can not be empty!',
                        style: SnackBarStyle.snackBarTextStyle,
                      ),
                      backgroundColor: SnackBarStyle.backgroundColor,
                      duration: SnackBarStyle.displayDuration,
                    ),
                  );
                }
              },
              child: const Text(
                'Add',
                style: AddTaskDialogStyle.addButtonTextStyle,
              ),
            ),
          ],
        );
      },
    );
  }
}
