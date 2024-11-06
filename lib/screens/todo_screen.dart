import 'package:flutter/material.dart';
// import 'package:flutter_home_work7/widgets/profile_header.dart';
// import 'package:flutter_home_work7/widgets/user_status_widget_stateful.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        title: const Text('User Profile'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return const SingleChildScrollView(
              child: Column(
                children: [
                  // ProfileHeader(),
                  // UserStatusWidget(
                  //   projectsCount: 49,
                  //   followersCount: 1640,
                  //   followingCount: 750,
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}