// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DBTaskData extends DataClass implements Insertable<DBTaskData> {
  final String taskId;
  final String taskName;
  final int noOfTasks;
  final int percentage;
  DBTaskData(
      {@required this.taskId,
      @required this.taskName,
      @required this.noOfTasks,
      @required this.percentage});
  factory DBTaskData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBTaskData(
      taskId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_id']),
      taskName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_name']),
      noOfTasks: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}no_of_tasks']),
      percentage: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}percentage']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<String>(taskId);
    }
    if (!nullToAbsent || taskName != null) {
      map['task_name'] = Variable<String>(taskName);
    }
    if (!nullToAbsent || noOfTasks != null) {
      map['no_of_tasks'] = Variable<int>(noOfTasks);
    }
    if (!nullToAbsent || percentage != null) {
      map['percentage'] = Variable<int>(percentage);
    }
    return map;
  }

  DBTaskCompanion toCompanion(bool nullToAbsent) {
    return DBTaskCompanion(
      taskId:
          taskId == null && nullToAbsent ? const Value.absent() : Value(taskId),
      taskName: taskName == null && nullToAbsent
          ? const Value.absent()
          : Value(taskName),
      noOfTasks: noOfTasks == null && nullToAbsent
          ? const Value.absent()
          : Value(noOfTasks),
      percentage: percentage == null && nullToAbsent
          ? const Value.absent()
          : Value(percentage),
    );
  }

  factory DBTaskData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBTaskData(
      taskId: serializer.fromJson<String>(json['taskId']),
      taskName: serializer.fromJson<String>(json['taskName']),
      noOfTasks: serializer.fromJson<int>(json['noOfTasks']),
      percentage: serializer.fromJson<int>(json['percentage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskId': serializer.toJson<String>(taskId),
      'taskName': serializer.toJson<String>(taskName),
      'noOfTasks': serializer.toJson<int>(noOfTasks),
      'percentage': serializer.toJson<int>(percentage),
    };
  }

  DBTaskData copyWith(
          {String taskId, String taskName, int noOfTasks, int percentage}) =>
      DBTaskData(
        taskId: taskId ?? this.taskId,
        taskName: taskName ?? this.taskName,
        noOfTasks: noOfTasks ?? this.noOfTasks,
        percentage: percentage ?? this.percentage,
      );
  @override
  String toString() {
    return (StringBuffer('DBTaskData(')
          ..write('taskId: $taskId, ')
          ..write('taskName: $taskName, ')
          ..write('noOfTasks: $noOfTasks, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      taskId.hashCode,
      $mrjc(
          taskName.hashCode, $mrjc(noOfTasks.hashCode, percentage.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBTaskData &&
          other.taskId == this.taskId &&
          other.taskName == this.taskName &&
          other.noOfTasks == this.noOfTasks &&
          other.percentage == this.percentage);
}

class DBTaskCompanion extends UpdateCompanion<DBTaskData> {
  final Value<String> taskId;
  final Value<String> taskName;
  final Value<int> noOfTasks;
  final Value<int> percentage;
  const DBTaskCompanion({
    this.taskId = const Value.absent(),
    this.taskName = const Value.absent(),
    this.noOfTasks = const Value.absent(),
    this.percentage = const Value.absent(),
  });
  DBTaskCompanion.insert({
    @required String taskId,
    @required String taskName,
    @required int noOfTasks,
    this.percentage = const Value.absent(),
  })  : taskId = Value(taskId),
        taskName = Value(taskName),
        noOfTasks = Value(noOfTasks);
  static Insertable<DBTaskData> custom({
    Expression<String> taskId,
    Expression<String> taskName,
    Expression<int> noOfTasks,
    Expression<int> percentage,
  }) {
    return RawValuesInsertable({
      if (taskId != null) 'task_id': taskId,
      if (taskName != null) 'task_name': taskName,
      if (noOfTasks != null) 'no_of_tasks': noOfTasks,
      if (percentage != null) 'percentage': percentage,
    });
  }

  DBTaskCompanion copyWith(
      {Value<String> taskId,
      Value<String> taskName,
      Value<int> noOfTasks,
      Value<int> percentage}) {
    return DBTaskCompanion(
      taskId: taskId ?? this.taskId,
      taskName: taskName ?? this.taskName,
      noOfTasks: noOfTasks ?? this.noOfTasks,
      percentage: percentage ?? this.percentage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (taskName.present) {
      map['task_name'] = Variable<String>(taskName.value);
    }
    if (noOfTasks.present) {
      map['no_of_tasks'] = Variable<int>(noOfTasks.value);
    }
    if (percentage.present) {
      map['percentage'] = Variable<int>(percentage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBTaskCompanion(')
          ..write('taskId: $taskId, ')
          ..write('taskName: $taskName, ')
          ..write('noOfTasks: $noOfTasks, ')
          ..write('percentage: $percentage')
          ..write(')'))
        .toString();
  }
}

class $DBTaskTable extends DBTask with TableInfo<$DBTaskTable, DBTaskData> {
  final GeneratedDatabase _db;
  final String _alias;
  $DBTaskTable(this._db, [this._alias]);
  final VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  GeneratedTextColumn _taskId;
  @override
  GeneratedTextColumn get taskId => _taskId ??= _constructTaskId();
  GeneratedTextColumn _constructTaskId() {
    return GeneratedTextColumn('task_id', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _taskNameMeta = const VerificationMeta('taskName');
  GeneratedTextColumn _taskName;
  @override
  GeneratedTextColumn get taskName => _taskName ??= _constructTaskName();
  GeneratedTextColumn _constructTaskName() {
    return GeneratedTextColumn('task_name', $tableName, false,
        minTextLength: 1);
  }

  final VerificationMeta _noOfTasksMeta = const VerificationMeta('noOfTasks');
  GeneratedIntColumn _noOfTasks;
  @override
  GeneratedIntColumn get noOfTasks => _noOfTasks ??= _constructNoOfTasks();
  GeneratedIntColumn _constructNoOfTasks() {
    return GeneratedIntColumn(
      'no_of_tasks',
      $tableName,
      false,
    );
  }

  final VerificationMeta _percentageMeta = const VerificationMeta('percentage');
  GeneratedIntColumn _percentage;
  @override
  GeneratedIntColumn get percentage => _percentage ??= _constructPercentage();
  GeneratedIntColumn _constructPercentage() {
    return GeneratedIntColumn('percentage', $tableName, false,
        defaultValue: Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [taskId, taskName, noOfTasks, percentage];
  @override
  $DBTaskTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<DBTaskData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id'], _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('task_name')) {
      context.handle(_taskNameMeta,
          taskName.isAcceptableOrUnknown(data['task_name'], _taskNameMeta));
    } else if (isInserting) {
      context.missing(_taskNameMeta);
    }
    if (data.containsKey('no_of_tasks')) {
      context.handle(_noOfTasksMeta,
          noOfTasks.isAcceptableOrUnknown(data['no_of_tasks'], _noOfTasksMeta));
    } else if (isInserting) {
      context.missing(_noOfTasksMeta);
    }
    if (data.containsKey('percentage')) {
      context.handle(
          _percentageMeta,
          percentage.isAcceptableOrUnknown(
              data['percentage'], _percentageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {taskId};
  @override
  DBTaskData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DBTaskData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DBTaskTable createAlias(String alias) {
    return $DBTaskTable(_db, alias);
  }
}

class DBToDoData extends DataClass implements Insertable<DBToDoData> {
  final String id;
  final String title;
  final bool completed;
  final int userId;
  final String taskId;
  DBToDoData(
      {@required this.id,
      @required this.title,
      @required this.completed,
      @required this.userId,
      @required this.taskId});
  factory DBToDoData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    return DBToDoData(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title']),
      completed: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}completed']),
      userId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}user_id']),
      taskId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}task_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || completed != null) {
      map['completed'] = Variable<bool>(completed);
    }
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<String>(taskId);
    }
    return map;
  }

  DBToDoCompanion toCompanion(bool nullToAbsent) {
    return DBToDoCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      completed: completed == null && nullToAbsent
          ? const Value.absent()
          : Value(completed),
      userId:
          userId == null && nullToAbsent ? const Value.absent() : Value(userId),
      taskId:
          taskId == null && nullToAbsent ? const Value.absent() : Value(taskId),
    );
  }

  factory DBToDoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return DBToDoData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      completed: serializer.fromJson<bool>(json['completed']),
      userId: serializer.fromJson<int>(json['userId']),
      taskId: serializer.fromJson<String>(json['taskId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'completed': serializer.toJson<bool>(completed),
      'userId': serializer.toJson<int>(userId),
      'taskId': serializer.toJson<String>(taskId),
    };
  }

  DBToDoData copyWith(
          {String id,
          String title,
          bool completed,
          int userId,
          String taskId}) =>
      DBToDoData(
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
        userId: userId ?? this.userId,
        taskId: taskId ?? this.taskId,
      );
  @override
  String toString() {
    return (StringBuffer('DBToDoData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completed: $completed, ')
          ..write('userId: $userId, ')
          ..write('taskId: $taskId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(title.hashCode,
          $mrjc(completed.hashCode, $mrjc(userId.hashCode, taskId.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DBToDoData &&
          other.id == this.id &&
          other.title == this.title &&
          other.completed == this.completed &&
          other.userId == this.userId &&
          other.taskId == this.taskId);
}

class DBToDoCompanion extends UpdateCompanion<DBToDoData> {
  final Value<String> id;
  final Value<String> title;
  final Value<bool> completed;
  final Value<int> userId;
  final Value<String> taskId;
  const DBToDoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.completed = const Value.absent(),
    this.userId = const Value.absent(),
    this.taskId = const Value.absent(),
  });
  DBToDoCompanion.insert({
    @required String id,
    @required String title,
    this.completed = const Value.absent(),
    @required int userId,
    @required String taskId,
  })  : id = Value(id),
        title = Value(title),
        userId = Value(userId),
        taskId = Value(taskId);
  static Insertable<DBToDoData> custom({
    Expression<String> id,
    Expression<String> title,
    Expression<bool> completed,
    Expression<int> userId,
    Expression<String> taskId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (completed != null) 'completed': completed,
      if (userId != null) 'user_id': userId,
      if (taskId != null) 'task_id': taskId,
    });
  }

  DBToDoCompanion copyWith(
      {Value<String> id,
      Value<String> title,
      Value<bool> completed,
      Value<int> userId,
      Value<String> taskId}) {
    return DBToDoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      userId: userId ?? this.userId,
      taskId: taskId ?? this.taskId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DBToDoCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('completed: $completed, ')
          ..write('userId: $userId, ')
          ..write('taskId: $taskId')
          ..write(')'))
        .toString();
  }
}

class $DBToDoTable extends DBToDo with TableInfo<$DBToDoTable, DBToDoData> {
  final GeneratedDatabase _db;
  final String _alias;
  $DBToDoTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedTextColumn _id;
  @override
  GeneratedTextColumn get id => _id ??= _constructId();
  GeneratedTextColumn _constructId() {
    return GeneratedTextColumn('id', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn('title', $tableName, false, minTextLength: 1);
  }

  final VerificationMeta _completedMeta = const VerificationMeta('completed');
  GeneratedBoolColumn _completed;
  @override
  GeneratedBoolColumn get completed => _completed ??= _constructCompleted();
  GeneratedBoolColumn _constructCompleted() {
    return GeneratedBoolColumn('completed', $tableName, false,
        defaultValue: Constant(false));
  }

  final VerificationMeta _userIdMeta = const VerificationMeta('userId');
  GeneratedIntColumn _userId;
  @override
  GeneratedIntColumn get userId => _userId ??= _constructUserId();
  GeneratedIntColumn _constructUserId() {
    return GeneratedIntColumn(
      'user_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  GeneratedTextColumn _taskId;
  @override
  GeneratedTextColumn get taskId => _taskId ??= _constructTaskId();
  GeneratedTextColumn _constructTaskId() {
    return GeneratedTextColumn('task_id', $tableName, false, minTextLength: 1);
  }

  @override
  List<GeneratedColumn> get $columns => [id, title, completed, userId, taskId];
  @override
  $DBToDoTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'd_b_to_do';
  @override
  final String actualTableName = 'd_b_to_do';
  @override
  VerificationContext validateIntegrity(Insertable<DBToDoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed'], _completedMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id'], _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(_taskIdMeta,
          taskId.isAcceptableOrUnknown(data['task_id'], _taskIdMeta));
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DBToDoData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return DBToDoData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DBToDoTable createAlias(String alias) {
    return $DBToDoTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DBTaskTable _dBTask;
  $DBTaskTable get dBTask => _dBTask ??= $DBTaskTable(this);
  $DBToDoTable _dBToDo;
  $DBToDoTable get dBToDo => _dBToDo ??= $DBToDoTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [dBTask, dBToDo];
}
