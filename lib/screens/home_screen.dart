import 'package:flutter/material.dart';
import 'package:flutter_home_work8/styles/text_styles.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        title: const Text(
          'My To-Do List',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextStyles.styledText('Welcome!', TextStyles.greetingsText),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/todo');
              },
              child: const Text(
                'Go to the profile', style: TextStyles.buttonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}