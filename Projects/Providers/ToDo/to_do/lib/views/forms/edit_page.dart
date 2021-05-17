import 'package:flutter/material.dart';
import 'package:to_do/core_services/cloud_firestore_service.dart';
import 'package:built_collection/built_collection.dart';
import 'package:to_do/models/todo.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key key,
    this.tasksList,
    this.toDoItem,
    this.currentTask,
  }) : super(key: key);
  final BuiltList<Task> tasksList;
  final ToDo toDoItem;
  final Task currentTask;
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final GlobalKey<FormState> _formKeyEdit = GlobalKey<FormState>();
  CloudFirestoreService localInstance = CloudFirestoreService();
  String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Page',
        ),
      ),
      body: Center(
        child: Form(
          key: _formKeyEdit,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: widget.toDoItem.title,
                style: TextStyle(
                  color: Theme.of(context).textTheme.subtitle2.color,
                ),
                decoration: const InputDecoration(
                  hintText: 'Edit your ToDo Title',
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
                  if (_formKeyEdit.currentState.validate()) {
                    ToDo toDoObj = widget.toDoItem.rebuild((b) {
                      b..title = title;
                      return b;
                    });
                    await localInstance.updateToDosTasks(
                      widget.currentTask,
                      toDoObj,
                    );
                    Navigator.of(context).pop();
                    // _formKeyEdit.currentState.reset();
                  }
                },
                child: const Text('Save Edited Title'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
