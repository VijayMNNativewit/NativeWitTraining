part of 'moor_database.dart';

class DBToDo extends Table {
  TextColumn get id => text().withLength(
        min: 1,
      )();
  // DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch)();

  int get millisecondsSinceEpoch => null;

  TextColumn get title => text().withLength(
        min: 1,
      )();

  BoolColumn get completed => boolean().withDefault(Constant(false))();

  IntColumn get userId => integer()();

  TextColumn get taskId => text().withLength(
        min: 1,
      )();

  // Set<Column> get foreignKey => {DBTask().taskId};

  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey => {id};
}

class DBTask extends Table {
  @override
  String get tableName => 'tasks';
  TextColumn get taskId => text().withLength(
        min: 1,
      )();

  TextColumn get taskName => text().withLength(
        min: 1,
      )();

  IntColumn get noOfTasks => integer()();

  IntColumn get percentage => integer().withDefault(Constant(0))();

  int get millisecondsSinceEpoch => null;

  //BuiltList<ToDo> toDosList

  @override
  // TODO: implement primaryKey
  Set<Column> get primaryKey => {taskId};
}
