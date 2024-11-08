import 'package:flutter/material.dart';
import 'package:flutter_home_work8/widgets/task_item.dart';

class TaskListItem extends StatelessWidget {
  final String item;
  final Animation<double> animation;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskListItem({
    super.key,
    required this.item,
    required this.animation,
    required this.isCompleted,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        onDelete();
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
        child: TaskItem(
          item: item,
          isCompleted: isCompleted,
          onChanged: onChanged,
          onEdit: onEdit,
          onDelete: onDelete,
        ),
      ),
    );
  }
}