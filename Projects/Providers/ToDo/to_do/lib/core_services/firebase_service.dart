import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/models/todo.dart';
import 'app_service.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService implements AppService {
  FirebaseFirestore database = FirebaseFirestore.instance;
  @override
  Future<bool> deleteToDos(ToDo toDoItem) async {
    await database
        .collection('Tasks')
        .doc('Task1')
        .collection('ToDosList')
        .doc('ToDo10')
        .delete()
        .then((value) {
      print('successfully deleted Task1->ToDo10');
    });
    return null;
  }

  @override
  Future<BuiltList<ToDo>> getToDos() {
    return database
        .collection('Tasks')
        .doc('Task1')
        .collection('ToDosList')
        .get()
        .then((value) {
      // print(value);
      // value.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
      //   print(element.data());
      // });
      List<ToDo> todosList = <ToDo>[];
      value.docs.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
        todosList.add(ToDo.fromJson(element.data()) as ToDo);
      });
      print('successfully read');
      return todosList.toBuiltList();
    });
    // return database.collection('Tasks/Task1/ToDosList/ToDo1').snapshots();
  }

  @override
  Future<ToDo> postToDos(ToDo toDoItem) async {
    await database
        .collection('Tasks')
        .doc('Task2')
        .collection('ToDosList')
        .doc('ToDo1')
        .set({
      'id': 1,
      'title': 'Learn Firebase1',
      'userId': 2,
      'completed': false,
    }).then((value) {
      print('successfully posted Task2->ToDo1');
    });
    return null;
  }

  @override
  Future<ToDo> updateToDos(ToDo toDoItem) async {
    await database
        .collection('Tasks')
        .doc('Task2')
        .collection('ToDosList')
        .doc('ToDo1')
        .update({'completed': true}).then((value) {
      print('successfully updated Task2->ToDo1');
    });
    return null;
  }
}
