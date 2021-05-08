import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import 'package:to_do/models/todo.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
    Key key,
    this.tasksList,
    this.index,
  }) : super(key: key);
  final BuiltList<Task> tasksList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.black,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    50.0,
                  ),
                ),
                child: Icon(
                  Icons.alarm,
                  color: Theme.of(context).primaryIconTheme.color,
                  size: Theme.of(context).primaryIconTheme.size,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      '${tasksList[index].noOfTasks} Tasks',
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      tasksList[index].taskName,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.headline4.fontSize,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: LinearProgressIndicator(
                              minHeight: 5,
                              backgroundColor: Colors.grey,
                              value:
                                  tasksList[index].percentage.toDouble() / 100,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${tasksList[index].percentage}%'),
                        ),
                      ],
                    ),
                  ].map((Widget child) {
                    return Padding(
                      padding: const EdgeInsets.all(
                        5.0,
                      ),
                      child: child,
                    );
                  }).toList(),
                ),
              ),
              const Text(
                'Previous - Thu',
              ),
              ListOfTasks(tasksList: tasksList),
              const Text(
                'Previous - Fri',
              ),
              ListOfTasks(tasksList: tasksList),
            ],
          ),
        ),
      ),
    );
  }
}

class ListOfTasks extends StatefulWidget {
  const ListOfTasks({
    Key key,
    @required this.tasksList,
  }) : super(key: key);
  final BuiltList<Task> tasksList;
  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  bool checkBoxValue;

  @override
  void initState() {
    super.initState();
    checkBoxValue = widget.tasksList[0].toDosList[0].completed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBoxValue,
                  // value: widget.tasksList[0].toDosList[0].completed,
                  activeColor: Colors.red,
                  title: Text(
                    widget.tasksList[0].toDosList[0].title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  secondary: const Icon(
                    Icons.alarm,
                  ),
                  onChanged: (bool newValue) {
                    setState(() {
                      widget.tasksList[0].toDosList[0].completed = newValue;
                      checkBoxValue = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBoxValue,
                  // value: widget.tasksList[0].toDosList[0].completed,
                  activeColor: Colors.red,
                  title: Text(
                    widget.tasksList[0].toDosList[0].title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  secondary: const Icon(
                    Icons.alarm,
                  ),
                  onChanged: (bool newValue) {
                    setState(() {
                      widget.tasksList[0].toDosList[0].completed = newValue;
                      checkBoxValue = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBoxValue,
                  // value: widget.tasksList[0].toDosList[0].completed,
                  activeColor: Colors.red,
                  title: Text(
                    widget.tasksList[0].toDosList[0].title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  secondary: const Icon(
                    Icons.alarm,
                  ),
                  onChanged: (bool newValue) {
                    setState(() {
                      widget.tasksList[0].toDosList[0].completed = newValue;
                      checkBoxValue = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBoxValue,
                  // value: widget.tasksList[0].toDosList[0].completed,
                  activeColor: Colors.red,
                  title: Text(
                    widget.tasksList[0].toDosList[0].title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  secondary: const Icon(
                    Icons.alarm,
                  ),
                  onChanged: (bool newValue) {
                    setState(() {
                      widget.tasksList[0].toDosList[0].completed = newValue;
                      checkBoxValue = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBoxValue,
                  // value: widget.tasksList[0].toDosList[0].completed,
                  activeColor: Colors.red,
                  title: Text(
                    widget.tasksList[0].toDosList[0].title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  secondary: const Icon(
                    Icons.alarm,
                  ),
                  onChanged: (bool newValue) {
                    setState(() {
                      widget.tasksList[0].toDosList[0].completed = newValue;
                      checkBoxValue = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  value: checkBoxValue,
                  // value: widget.tasksList[0].toDosList[0].completed,
                  activeColor: Colors.red,
                  title: Text(
                    widget.tasksList[0].toDosList[0].title,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  secondary: const Icon(
                    Icons.alarm,
                  ),
                  onChanged: (bool newValue) {
                    setState(() {
                      widget.tasksList[0].toDosList[0].completed = newValue;
                      checkBoxValue = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
