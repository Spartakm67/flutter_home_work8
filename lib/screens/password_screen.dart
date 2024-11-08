import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_home_work8/styles/text_styles.dart';
import 'package:flutter_home_work8/styles/container_styles.dart';
import 'package:flutter_home_work8/styles/snack_bar_styles.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  PasswordScreenState createState() => PasswordScreenState();
}

class PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final String _correctPassword = dotenv.env['PASSWORD'] ?? '';
  bool _obscureText = true;
  bool _isPasswordFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _isPasswordFieldEmpty = _passwordController.text.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in to the To-Do app'),
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.6),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.grey],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.all(30.0),
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
                      suffixIcon: _isPasswordFieldEmpty
                          ? null
                          : IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                    ),
                    obscureText: _obscureText,
                    autofocus: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: _checkPassword,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Sign in',
                        style: TextStyles.buttonText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _checkPassword() {
    if (_passwordController.text == _correctPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Successful login!',
            style: SnackBarStyle.snackBarTextStyle,
          ),
          backgroundColor: SnackBarStyle.backgroundColor,
          duration: SnackBarStyle.displayDuration,
        ),
      );
      Navigator.pushNamed(context, '/todo');
      _passwordController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Invalid password!',
            style: SnackBarStyle.snackBarTextStyle,
          ),
          backgroundColor: SnackBarStyle.backgroundColor,
          duration: SnackBarStyle.displayDuration,
        ),
      );
      _passwordController.clear();
    }
  }
}
