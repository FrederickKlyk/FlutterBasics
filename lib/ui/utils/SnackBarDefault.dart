import 'package:flutter/material.dart';

class SnackBarDefault {
  void defaultSnackBar(BuildContext context, String content, Function undo) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      duration: Duration(seconds: 2),
      action: SnackBarAction(label: "Zurücksetzen", onPressed: () => undo()),
    ));
  }
}
