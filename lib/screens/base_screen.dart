import 'package:flutter/material.dart';
class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Titile"),
        ),
        body: Center(
            child: Text(widget.text),
        ),
    );
  }
}
