import 'package:flutter/material.dart';

class TaskCreateScreen extends StatefulWidget {
  @override
  _TaskCreateScreenState createState() => _TaskCreateScreenState();
}

class _TaskCreateScreenState extends State<TaskCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create new Task'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Text('New Task'),
          ),
        ));
  }
}
