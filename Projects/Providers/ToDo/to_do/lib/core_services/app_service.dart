import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:to_do/models/todo.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class AppService implements ApiService {
  static const String toDoSource = 'https://jsonplaceholder.typicode.com/todos';

  final Map<String, String> _headers = <String, String>{
    'Content-type': 'application/json; charset=UTF-8'
  };

  @override
  Future<BuiltList<ToDo>> getToDos() async {
    final http.Response response = await http.get(
      Uri.parse(toDoSource),
      headers: _headers,
    );
    final String jsonString = response.body;
    return parseToDoItems(jsonString);
  }

  BuiltList<ToDo> parseToDoItems(String jsonString) {
    final List<dynamic> parsed = jsonDecode(jsonString) as List<dynamic>;
    return BuiltList<ToDo>(
      parsed.map((dynamic e) {
        return ToDo.fromJson(e as Map<String, dynamic>);
      }).toList(),
    );
  }

  @override
  Future<ToDo> postToDos(
    ToDo toDoItem,
  ) async {
    final String body = jsonEncode(toDoItem.toJson());
    final http.Response response = await http.post(
      Uri.parse('$toDoSource/users/1/todos'),
      body: body,
      headers: _headers,
    );
    final String jsonString = response.body;
    return parseToDo(jsonString);
  }

  @override
  Future<ToDo> updateToDos(
    ToDo toDoItem,
  ) async {
    final String body = jsonEncode(toDoItem.toJson());
    final http.Response response = await http.put(
      Uri.parse('$toDoSource/users/1/todos{$toDoItem.id}'),
      body: body,
      headers: _headers,
    );

    if (response.statusCode > 300) {
      return toDoItem;
    }
    final String jsonString = response.body;
    return parseToDo(jsonString);
  }

  ToDo parseToDo(String jsonString) {
    final Map<String, dynamic> parsed =
        jsonDecode(jsonString) as Map<String, dynamic>;
    return ToDo.fromJson(parsed);
  }

  @override
  Future<bool> deleteToDos(
    ToDo toDoItem,
  ) async {
    final http.Response response = await http.delete(
      Uri.parse('$toDoSource/users/1/todos/${toDoItem.id}'),
      headers: _headers,
    );

    if (response.statusCode > 300) {
      return true;
    }
    return response.statusCode >= 200 && response.statusCode < 300;
  }
}
