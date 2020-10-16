import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'UI.dart';

void main() {
  runApp(UI());
}

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Ui(),
    );
  }
}
