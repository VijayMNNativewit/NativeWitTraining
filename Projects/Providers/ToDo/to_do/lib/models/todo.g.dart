// GENERATED CODE - DO NOT MODIFY BY HAND

part of todo;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ToDo> _$toDoSerializer = new _$ToDoSerializer();

class _$ToDoSerializer implements StructuredSerializer<ToDo> {
  @override
  final Iterable<Type> types = const [ToDo, _$ToDo];
  @override
  final String wireName = 'ToDo';

  @override
  Iterable<Object> serialize(Serializers serializers, ToDo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userId;
    if (value != null) {
      result
        ..add('userId')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.completed;
    if (value != null) {
      result
        ..add('completed')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  ToDo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ToDoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'userId':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$ToDo extends ToDo {
  @override
  final int userId;
  @override
  final int id;
  @override
  final String title;
  @override
  final bool completed;
  @override
  final bool isLoading;

  factory _$ToDo([void Function(ToDoBuilder) updates]) =>
      (new ToDoBuilder()..update(updates)).build();

  _$ToDo._({this.userId, this.id, this.title, this.completed, this.isLoading})
      : super._();

  @override
  ToDo rebuild(void Function(ToDoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToDoBuilder toBuilder() => new ToDoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToDo &&
        userId == other.userId &&
        id == other.id &&
        title == other.title &&
        completed == other.completed &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, userId.hashCode), id.hashCode), title.hashCode),
            completed.hashCode),
        isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ToDo')
          ..add('userId', userId)
          ..add('id', id)
          ..add('title', title)
          ..add('completed', completed)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class ToDoBuilder implements Builder<ToDo, ToDoBuilder> {
  _$ToDo _$v;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _completed;
  bool get completed => _$this._completed;
  set completed(bool completed) => _$this._completed = completed;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  ToDoBuilder();

  ToDoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _id = $v.id;
      _title = $v.title;
      _completed = $v.completed;
      _isLoading = $v.isLoading;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ToDo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ToDo;
  }

  @override
  void update(void Function(ToDoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ToDo build() {
    final _$result = _$v ??
        new _$ToDo._(
            userId: userId,
            id: id,
            title: title,
            completed: completed,
            isLoading: isLoading);
    replace(_$result);
    return _$result;
  }
}

class _$Task extends Task {
  @override
  final BuiltList<ToDo> toDosList;
  @override
  final String taskName;
  @override
  final int noOfTasks;
  @override
  final int percentage;

  factory _$Task([void Function(TaskBuilder) updates]) =>
      (new TaskBuilder()..update(updates)).build();

  _$Task._({this.toDosList, this.taskName, this.noOfTasks, this.percentage})
      : super._();

  @override
  Task rebuild(void Function(TaskBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaskBuilder toBuilder() => new TaskBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Task &&
        toDosList == other.toDosList &&
        taskName == other.taskName &&
        noOfTasks == other.noOfTasks &&
        percentage == other.percentage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, toDosList.hashCode), taskName.hashCode),
            noOfTasks.hashCode),
        percentage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Task')
          ..add('toDosList', toDosList)
          ..add('taskName', taskName)
          ..add('noOfTasks', noOfTasks)
          ..add('percentage', percentage))
        .toString();
  }
}

class TaskBuilder implements Builder<Task, TaskBuilder> {
  _$Task _$v;

  ListBuilder<ToDo> _toDosList;
  ListBuilder<ToDo> get toDosList =>
      _$this._toDosList ??= new ListBuilder<ToDo>();
  set toDosList(ListBuilder<ToDo> toDosList) => _$this._toDosList = toDosList;

  String _taskName;
  String get taskName => _$this._taskName;
  set taskName(String taskName) => _$this._taskName = taskName;

  int _noOfTasks;
  int get noOfTasks => _$this._noOfTasks;
  set noOfTasks(int noOfTasks) => _$this._noOfTasks = noOfTasks;

  int _percentage;
  int get percentage => _$this._percentage;
  set percentage(int percentage) => _$this._percentage = percentage;

  TaskBuilder();

  TaskBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _toDosList = $v.toDosList?.toBuilder();
      _taskName = $v.taskName;
      _noOfTasks = $v.noOfTasks;
      _percentage = $v.percentage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Task other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Task;
  }

  @override
  void update(void Function(TaskBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Task build() {
    _$Task _$result;
    try {
      _$result = _$v ??
          new _$Task._(
              toDosList: _toDosList?.build(),
              taskName: taskName,
              noOfTasks: noOfTasks,
              percentage: percentage);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'toDosList';
        _toDosList?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Task', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
