import 'package:flutter/material.dart';

class TaskIndexScreen extends StatefulWidget {
  @override
  _TaskIndexScreenState createState() => _TaskIndexScreenState();
}

class _TaskIndexScreenState extends State<TaskIndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Tasks'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed('/tasks/create'),
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Center(
            child: Text('Task Screen'),
          ),
        ));
  }
}
