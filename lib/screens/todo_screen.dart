import 'package:flutter/material.dart';
import 'package:flutter_home_work8/services/add_task_dialog.dart';
import 'package:flutter_home_work8/services/edit_task_dialog.dart';
import 'package:flutter_home_work8/repository/repository.dart';
import 'package:flutter_home_work8/widgets/task_list_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  TodoScreenState createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<bool> _completed = [false, false, false];

  void addItem(String newTask) {
    const index = 0;
    setState(() {
      Repository.items.insert(index, newTask);
      _completed.insert(index, false);
    });
    _updateItemNumbers();
    _listKey.currentState?.insertItem(index);
  }

  void _showAddTaskDialog() async {
    await AddTaskDialog.show(context, addItem);
  }

  void _removeItem(int index) {
    final removedItem = Repository.items[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to delete?'),
          content: Text('Task: $removedItem'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  Repository.items.removeAt(index);
                  _completed.removeAt(index);
                });
                _updateItemNumbers();
                _listKey.currentState?.removeItem(
                  index,
                  (context, animation) => SizeTransition(
                    sizeFactor: animation,
                    child: Container(
                      color: Colors.redAccent,
                      child: ListTile(
                        title: Text(
                          removedItem,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  duration: const Duration(milliseconds: 300),
                );
                Navigator.of(context).pop();
              },
              child: const Text('Yes, delete'),
            ),
          ],
        );
      },
    );
  }

  void _updateItemNumbers() {
    for (var i = 0; i < Repository.items.length; i++) {
      Repository.items[i] =
          'Task ${i + 1}: ${Repository.items[i].split(': ').last}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        title: const Text('To-Do List'),
      ),
      backgroundColor: Colors.lightBlue[50],
      body: AnimatedList(
        key: _listKey,
        initialItemCount: Repository.items.length,
        itemBuilder: (context, index, animation) {
          return TaskListItem(
            item: Repository.items[index],
            animation: animation,
            isCompleted: _completed[index],
            onChanged: (value) {
              setState(() {
                _completed[index] = value ?? false;
              });
            },
            onEdit: () async {
              final updatedTask = await EditTaskDialog.showEditDialog(
                context,
                Repository.items[index].split(': ').last,
                index + 1,
              );
              if (updatedTask != null && updatedTask.isNotEmpty) {
                setState(() {
                  Repository.items[index] = 'Task ${index + 1}: $updatedTask';
                });
              }
            },
            onDelete: () => _removeItem(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
