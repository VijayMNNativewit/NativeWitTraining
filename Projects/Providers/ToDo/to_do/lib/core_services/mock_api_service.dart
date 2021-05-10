import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:to_do/models/todo.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class MockAPI extends ApiService {
  ToDo toDoObj = ToDo((ToDoBuilder b) {
    b
      ..id = 1
      ..completed = false
      ..title = 'Test Object1'
      ..userId = 1;
    return b;
  });
  // @override
  // Future<List<Product>> getProducts() {
  //   return Future.value([
  //     Product(
  //         id: 1,
  //         name: "MacBook Pro 16-inch model",
  //         price: 2399,
  //         imageUrl: "imageUrl"),
  //     Product(id: 2, name: "AirPods Pro", price: 249, imageUrl: "imageUrl"),
  //   ]);
  // }

  @override
  Future<bool> deleteToDos(ToDo toDoItem) async {
    // print('ToDoItem ID: ${toDoItem.id} ToDoObj ID: ${toDoObj.id}');
    if (toDoItem.id == toDoObj.id) {
      return true;
    }
    return false;
  }

  @override
  Future<BuiltList<ToDo>> getToDos() {
    return Future.value(
      [
        ToDo((ToDoBuilder b) {
          b
            ..title = 'Test Obj1'
            ..completed = false
            ..userId = 1
            ..id = 1;
          return b;
        }),
        ToDo((ToDoBuilder b) {
          b
            ..title = 'Test Obj2'
            ..completed = false
            ..userId = 1
            ..id = 2;
          return b;
        }),
      ].toBuiltList(),
    );
  }

  @override
  Future<ToDo> postToDos(ToDo toDoItem) async {
    // print('ToDoItem ID: ${toDoItem.id} ToDoObj ID: ${toDoObj.id}');
    if (toDoItem.id != toDoObj.id) {
      return await toDoItem;
    }
    return await ToDo();
  }

  @override
  Future<ToDo> updateToDos(ToDo toDoItem) async {
    // print('ToDoItem ID: ${toDoItem.id} ToDoObj ID: ${toDoObj.id}');
    if (toDoItem.id == toDoObj.id) {
      return await toDoItem;
    }
    return await ToDo();
  }
}
