import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_home_work8/styles/text_styles.dart';
import 'package:flutter_home_work8/styles/container_styles.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  PasswordScreenState createState() => PasswordScreenState();
}

class PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final String _correctPassword = dotenv.env['PASSWORD'] ?? '';

  void _checkPassword() {
    if (_passwordController.text == _correctPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Successful login!'),
        ),
      );
      Navigator.pushReplacementNamed(context, '/todo');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid password!'),
        ),
      );
      _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in to the To-Do app'),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(26.0),
            decoration: ContainerStyles.containerDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextStyles.styledText('Welcome!', TextStyles.greetingsText),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    labelStyle: TextStyles.labelText(context),
                    // alignLabelWithHint: true,
                  ),
                  textAlign: TextAlign.center,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _checkPassword,
                  child: const Text(
                    'Sign in',
                    style: TextStyles.buttonText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
