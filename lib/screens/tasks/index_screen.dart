import 'package:auth_starter/models/task.dart';
import 'package:auth_starter/providers/task_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskIndexScreen extends StatefulWidget {
  @override
  _TaskIndexScreenState createState() => _TaskIndexScreenState();
}

class _TaskIndexScreenState extends State<TaskIndexScreen> {
  @override
  Widget build(BuildContext context) {
    final TaskProvider taskProvider = Provider.of<TaskProvider>(context);
    List<Task> tasks = taskProvider.tasks;

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
          child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  focusColor: Colors.indigo[300],
                  leading: FlutterLogo(),
                  onTap: () => print('You just tapped me'),
                  onLongPress: () => print('You pressed me too much'),
                  title: Text(tasks[index].title),
                  subtitle: Text(tasks[index].date),
                  isThreeLine: true,
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text('Delete?'),
                                content: Text(
                                    'Are you sure you want to delete this task?'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('No')),
                                  FlatButton(
                                      onPressed: () {
                                        taskProvider
                                            .removeTask(tasks[index].id);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Yes')),
                                ],
                              ));
                    },
                    icon: Icon(Icons.delete_outline),
                  ),
                );
              }),
        ));
  }
}
