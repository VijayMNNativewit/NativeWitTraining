import 'package:built_collection/src/list.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core_services/cloud_firestore_service.dart';
import 'package:to_do/models/todo.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({Key key}) : super(key: key);

  @override
  _FormsPageState createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyInternal = GlobalKey<FormState>();

  String title, taskTitle;
  int userId, id = 1;
  final bool completed = false;
  int noOfTasks, percentage;
  List<ToDo> toDosList = <ToDo>[];
  CloudFirestoreService localInstance = CloudFirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forms',
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              style: TextStyle(
                color: Theme.of(context).textTheme.subtitle2.color,
              ),
              decoration: const InputDecoration(
                hintText: 'Enter your Task Title',
              ),
              validator: (String value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                taskTitle = value;
                // print(title);
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  noOfTasks = toDosList.length;
                  percentage = 0;
                  Task taskObj = Task((TaskBuilder b) {
                    b
                      ..taskName = taskTitle
                      ..taskId = DateTime.now().millisecondsSinceEpoch
                      ..percentage = percentage
                      ..noOfTasks = noOfTasks
                      ..toDosList.addAll(toDosList);
                    return b;
                  });
                  await localInstance.postToDosTasks(taskObj);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Submit'),
            ),
            Form(
              key: _formKeyInternal,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle2.color,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Enter your ToDo',
                    ),
                    validator: (String value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      title = value;
                      // print(title);
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKeyInternal.currentState.validate()) {
                        ToDo toDoObj = ToDo((ToDoBuilder b) {
                          b
                            ..id = DateTime.now().millisecondsSinceEpoch
                            ..completed = completed
                            ..title = title;
                          return b;
                        });
                        id += 1;
                        toDosList.add(toDoObj);
                        _formKeyInternal.currentState.reset();
                      }
                    },
                    child: const Text('Add ToDo to Task List'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
