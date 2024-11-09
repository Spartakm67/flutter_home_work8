import 'package:flutter/material.dart';
import 'package:flutter_home_work8/styles/text_styles.dart';
import 'package:flutter_home_work8/styles/container_styles.dart';

class TaskDetailScreen extends StatelessWidget {
  final String item;

  const TaskDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        title: const Text('Task Details'),
      ),

      body: Container(
        decoration: ContainerStyles.gradientDecoration,
        child: Center(
          child: Hero(
            tag: 'taskHero',
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                item,
                style: TextStyles.greetingsText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
