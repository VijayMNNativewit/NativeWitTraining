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
              ListOfTasks(
                tasksList: tasksList,
                splitToDoList: tasksList[0].toDosList.sublist(
                      0,
                      5,
                    ),
              ),
              const Text(
                'Previous - Fri',
              ),
              ListOfTasks(
                tasksList: tasksList,
                splitToDoList: tasksList[0].toDosList.sublist(5),
              ),
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
    this.splitToDoList,
  }) : super(key: key);
  final BuiltList<Task> tasksList;
  final BuiltList<ToDo> splitToDoList;
  @override
  _ListOfTasksState createState() => _ListOfTasksState();
}

class _ListOfTasksState extends State<ListOfTasks> {
  List<bool> checkBoxValue = <bool>[];
  int iter = 0;

  @override
  void initState() {
    super.initState();

    for (var iterValue in widget.splitToDoList) {
      checkBoxValue.add(widget.splitToDoList[iter].completed);
      iter += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.5,
      // width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.splitToDoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  Expanded(
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkBoxValue[index],
                      // value: widget.tasksList[0].toDosList[0].completed,
                      activeColor: Colors.red,
                      title: Text(
                        widget.splitToDoList[index].title,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      secondary: const Icon(
                        Icons.alarm,
                      ),
                      onChanged: (bool newValue) {
                        setState(() {
                          widget.splitToDoList[index].completed = newValue;
                          checkBoxValue[index] = newValue;
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
