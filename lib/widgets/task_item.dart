import 'package:flutter/material.dart';
import 'package:flutter_home_work8/styles/text_styles.dart';
import 'package:flutter_home_work8/screens/task_detail_screen.dart';

class TaskItem extends StatelessWidget {
  final String item;
  final bool isCompleted;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.item,
    required this.isCompleted,
    required this.onChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isCompleted ? Colors.green.withOpacity(0.2) : Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        title: Hero(
          tag: 'taskHero',
          child: Text(
            item,
            style: TextStyles.tileText,
          ),
        ),
        leading: Checkbox(
          value: isCompleted,
          onChanged: onChanged,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              iconSize: 18,
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(
                Icons.delete_sweep,
                color: Colors.deepOrange,
              ),
              iconSize: 18,
              onPressed: onDelete,
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TaskDetailScreen(item: item),
          ),);},
      ),
    );
  }
}
