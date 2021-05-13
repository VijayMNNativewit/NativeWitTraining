import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/core_services/firebase_service.dart';
import 'package:to_do/core_services/app_service.dart';
import 'package:to_do/models/todo.dart';
import 'package:built_collection/built_collection.dart';

class TestUI extends StatelessWidget {
  const TestUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                AppService firebaseService = FirebaseService();
                // firebaseService.getToDos();
                ToDo todoItem = ToDo((ToDoBuilder b) {
                  b
                    ..title = 'Learn Providers'
                    ..userId = 1
                    ..completed = false;
                });
                firebaseService.postToDos(todoItem);
              },
              child: const Text(
                'Create ToDos!',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                AppService firebaseService = FirebaseService();
                final BuiltList<ToDo> toDosList =
                    await firebaseService.getToDos();
                // firebaseService.getToDos();
                print(toDosList);
              },
              child: const Text(
                'Read ToDos!',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AppService firebaseService = FirebaseService();
                ToDo todoItem = ToDo((ToDoBuilder b) {
                  b
                    ..title = 'Learn Providers'
                    ..userId = 1
                    ..completed = false;
                });
                firebaseService.updateToDos(todoItem);
              },
              child: const Text(
                'Update ToDos!',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                AppService firebaseService = FirebaseService();
                ToDo todoItem = ToDo((ToDoBuilder b) {
                  b
                    ..title = 'Learn Providers'
                    ..userId = 1
                    ..completed = false;
                });
                firebaseService.deleteToDos(todoItem);
              },
              child: const Text(
                'Delete ToDos!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
