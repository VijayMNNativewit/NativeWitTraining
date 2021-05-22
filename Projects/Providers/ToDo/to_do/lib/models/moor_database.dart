import 'package:moor/moor.dart';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:built_collection/built_collection.dart';
import 'todo.dart';
// import 'moor_database_db_models.dart';

part 'moor_database.g.dart';
part 'moor_database_db_models.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}

@UseMoor(tables: [DBTask, DBToDo])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<BuiltList<Task>> getTasks({
    @required String taskId,
  }) async {
    SimpleSelectStatement<$DBTaskTable, DBTaskData> query;
    query = select(dBTask)
      ..where(($DBTaskTable tbl) => tbl.taskId.equals(taskId));
    final List<DBTask> tasks = await query.get();
    final List<Task> convertedTasks =
        tasks.map((DBTask e) => e.toBuiltValue<Task>()).toList();
    return convertedTasks.toBuiltList();
  }

  Future<BuiltList<ToDo>> getToDos({
    @required String toDoId,
    @required String taskId,
  }) async {
    SimpleSelectStatement<$DBToDoTable, DBToDo> query;
    query = select(dBToDo)
      ..where(($DBToDoTable tbl) => tbl.taskId.equals(taskId));
    // ..where(($DBToDoTable tbl) => tbl.id.equals(toDoId));
    final List<DBToDo> todos = await query.get();
    final List<ToDo> convertedToDos =
        todos.map((DBToDo e) => e.toBuiltValue<ToDo>()).toList();
    return convertedToDos.toBuiltList();
  }

  Future<bool> postToDosTasks({
    @required String taskId,
    @required BuiltList<ToDo> toDos,
    @required Task task,
  }) async {}

  void updateToDosTasks({
    @required ToDo toDo,
  }) {
    insert();
  }

  void deleteToDosTasks() {}
}
