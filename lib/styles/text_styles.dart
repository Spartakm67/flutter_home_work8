import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle buttonText = TextStyle(
    fontSize: 24,
    color: Colors.red,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 5.0,
        color: Colors.black26,
      ),
    ],
  );

  static TextStyle defaultText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 400 ? 16 : 22;
    return TextStyle(
      fontSize: fontSize,
      color: Colors.grey,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle labelText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 400 ? 18 : 24;
    return TextStyle(
      fontSize: fontSize,
      color: Colors.grey,
      fontStyle: FontStyle.italic,
    );
  }

  static const TextStyle greetingsText = TextStyle(
    fontSize: 32,
    color: Colors.redAccent,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  );

  static TextStyle userText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 400 ? 16 : 22;
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: Colors.blue,
    );
  }

  static TextStyle countText(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 400 ? 24 : 36;
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: Colors.indigo,
    );
  }

  static Text styledText(String text, TextStyle style) {
    return Text(
      text,
      style: style,
      softWrap: true,
      overflow: TextOverflow.visible,
    );
  }

  static const TextStyle tileText = TextStyle(
    fontSize: 16,
    color: Colors.indigo,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
  );

}

