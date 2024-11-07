import 'package:flutter/material.dart';
import 'package:flutter_home_work8/styles/container_styles.dart';
// import 'package:flutter_home_work7/widgets/profile_header.dart';
// import 'package:flutter_home_work7/widgets/user_status_widget_stateful.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  TodoScreenState createState() => TodoScreenState();
}

class TodoScreenState extends State<TodoScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = ['Task 1', 'Task 2', 'Task 3'];

  void _addItem() {
    const index = 0;
    _items.insert(index, 'Task 1');

    _updateItemNumbers();
    _listKey.currentState?.insertItem(index);
  }

  void _removeItem(int index) {
    final removedItem = _items[index];
    _items.removeAt(index);

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
          decoration: ContainerStyles.containerTask,
          child: ListTile(
            title: Text(item, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _removeItem(index),
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
      body: Container(
        color: Colors.lightBlue[50],
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            return _buildItem(_items[index], animation, index);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}


