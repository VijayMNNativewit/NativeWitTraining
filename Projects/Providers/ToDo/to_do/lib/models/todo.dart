library todo;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';
import 'serializers.dart';

part 'todo.g.dart';

abstract class ToDo implements Built<ToDo, ToDoBuilder> {
  factory ToDo([void Function(ToDoBuilder) updates]) = _$ToDo;
  ToDo._();

  static ToDo create({@required String title, int userId}) {
    assert(title != null);
    return ToDo((ToDoBuilder b) {
      b
        ..title = title
        ..userId = userId
        ..completed = false;
    });
  }

  @nullable
  @BuiltValueField(wireName: 'userId')
  int get userId;

  set userId(int userId) {
    userId = userId;
  }

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  set id(int id) {
    id = id;
  }

  @nullable
  @BuiltValueField(wireName: 'title')
  String get title;

  set title(String title) {
    title = title;
  }

  @nullable
  @BuiltValueField(wireName: 'completed')
  bool get completed;

  set completed(bool completed) {
    completed = completed;
  }

  @nullable
  @BuiltValueField(serialize: false)
  bool get isLoading;

  bool get isCompleted {
    return completed;
  }

  bool get isNotCompleted {
    return !completed;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(ToDo.serializer, this)
        as Map<String, dynamic>;
  }

  static ToDo fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(ToDo.serializer, jsonString);
  }

  static Serializer<ToDo> get serializer => _$toDoSerializer;
}

abstract class Task implements Built<Task, TaskBuilder> {
  factory Task([void Function(TaskBuilder b) updates]) = _$Task;
  Task._();

  @nullable
  int get taskId;

  set taskId(int taskId) {
    taskId = taskId;
  }

  @nullable
  BuiltList<ToDo> get toDosList;

  set toDosList(BuiltList<ToDo> toDosList) {
    toDosList = toDosList;
  }

  @nullable
  String get taskName;

  set taskName(String taskName) {
    taskName = taskName;
  }

  @nullable
  int get noOfTasks;

  set noOfTasks(int noOfTasks) {
    noOfTasks = noOfTasks;
  }

  @nullable
  int get percentage;

  set percentage(int percentage) {
    percentage = percentage;
  }

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Task.serializer, this)
        as Map<String, dynamic>;
  }

  static Task fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Task.serializer, jsonString);
  }

  static Serializer<Task> get serializer => _$taskSerializer;
}
