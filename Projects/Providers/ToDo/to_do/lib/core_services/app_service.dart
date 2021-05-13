import 'package:to_do/models/todo.dart';
import 'package:built_collection/built_collection.dart';

abstract class AppService {
  Future<BuiltList<ToDo>> getToDos();
  Future<ToDo> postToDos(
    ToDo toDoItem,
  );
  Future<ToDo> updateToDos(
    ToDo toDoItem,
  );
  Future<bool> deleteToDos(
    ToDo toDoItem,
  );
}
