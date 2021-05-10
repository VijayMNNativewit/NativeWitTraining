import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/core_services/mock_api_service.dart';
import 'package:to_do/models/todo.dart';
import 'package:to_do/core_services/app_service.dart';
import 'package:built_collection/built_collection.dart';
import 'package:to_do/core_services/api_service.dart';

void main() {
  group('App Service Tests', () {
    ApiService testObject = AppService();
    ApiService mockObject = MockAPI();
    ToDo toDoItem1 = ToDo((ToDoBuilder b) {
      b
        ..id = 1
        ..completed = false
        ..title = 'Test Object1'
        ..userId = 1;
      return b;
    });
    ToDo toDoItem2 = ToDo((ToDoBuilder b) {
      b
        ..id = 2
        ..completed = false
        ..title = 'Test Object2'
        ..userId = 1;
      return b;
    });
    test('Fetch To Dos', () async {
      BuiltList<ToDo> fetchedToDos = await mockObject.getToDos();
      expect(fetchedToDos[0].title, 'Test Obj1');
      expect(fetchedToDos[1].title, 'Test Obj2');
    });
    test('Post To Dos', () async {
      ToDo postedToDo = await mockObject.postToDos(toDoItem2);
      // print(postedToDo);
      expect(postedToDo, toDoItem2);
    });
    test('Update To Dos', () async {
      ToDo updatedToDo = await mockObject.updateToDos(toDoItem1);
      expect(updatedToDo, toDoItem1);
    });
    test('Delete To Dos', () async {
      bool deleteToDo = await mockObject.deleteToDos(toDoItem1);
      expect(deleteToDo, true);
    });
  });
}
