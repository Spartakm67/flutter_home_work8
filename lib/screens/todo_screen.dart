import 'package:flutter/material.dart';
import 'package:flutter_home_work8/styles/text_styles.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  TodoScreenState createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['Task 1', 'Task 2', 'Task 3'];
  // final List<String> _tasks = ['Fix last project code', 'Buy the book', 'Watch news'];
  final List<bool> _completed = [false, false, false];
  final TextEditingController _taskController = TextEditingController();

  void _addItem() {
    _taskController.clear();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add new task'),
          content: TextField(
            controller: _taskController,
            decoration: const InputDecoration(
              hintText: 'Enter new task',
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newTaskText = _taskController.text.trim().isEmpty
                    ? 'Task ${_items.length + 1}'
                    : _taskController.text.trim();
                const index = 0;
                setState(() {
                  _items.insert(index, 'Task 1');
                  _completed.insert(index, false);
                });
                _updateItemNumbers();
                _listKey.currentState?.insertItem(index);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _removeItem(int index) {
    final removedItem = _items[index];
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
                  _items.removeAt(index);
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
    for (var i = 0; i < _items.length; i++) {
      _items[i] = 'Task ${i + 1}';
    }
  }

  Widget _buildItem(String item, Animation<double> animation, int index) {
    return Dismissible(
      key: Key(item),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        _removeItem(index);
        return false;
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: SizeTransition(
        sizeFactor: animation,
        child: Container(
          decoration: BoxDecoration(
            color: _completed[index]
                ? Colors.green.withOpacity(0.2)
                : Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            title: Text(
              item,
              style: TextStyles.tileText,
            ),
            leading: Checkbox(
              value: _completed[index],
              onChanged: (bool? value) {
                setState(() {
                  _completed[index] = value ?? false;
                });
              },
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  iconSize: 18,
                  onPressed: () {
                    // final editFeature = EditFeature();
                    // editFeature.editTask(
                    //   context,
                    //   task['id'],
                    //   task['item'],
                    // );
                  },
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_sweep,
                    color: Colors.deepOrange,
                  ),
                  iconSize: 18,
                  onPressed: () => _removeItem(index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation, index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
