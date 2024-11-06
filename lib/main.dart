import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_home_work8/screens/home_screen.dart';
import 'package:flutter_home_work8/screens/todo_screen.dart';
import 'package:flutter_home_work8/screens/password_screen.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PasswordScreen(),
        '/home': (context) => const HomeScreen(),
        '/todo': (context) => const TodoScreen(),
      },
    );
  }
}




