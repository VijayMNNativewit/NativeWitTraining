import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
// import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:to_do/core_services/app_service.dart';
import 'package:to_do/core_services/cloud_firestore_service.dart';
import 'package:to_do/models/todo.dart';
import 'package:to_do/models/moor_database.dart';
import 'package:to_do/views/forms/forms_page.dart';
import 'package:to_do/views/tasks/tasks_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Color> colors = const <Color>[
    Colors.red,
    Colors.blue,
    Colors.grey,
    Colors.green,
    Colors.orange,
  ];
  int colorIndex = 0;
  BuiltList<ToDo> toDosLists = <ToDo>[].toBuiltList();
  BuiltList<Task> tasksList = <Task>[Task()].toBuiltList();
  BuiltList<Task> tasksListFirestore = <Task>[].toBuiltList();
  BuiltList<ToDo> toDosListFirestore = <ToDo>[].toBuiltList();
  CloudFirestoreService cloudFirestoreInstance = CloudFirestoreService();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    // toDosLists = List<ToDo>.generate(10, (int index) {
    //   return ToDo((ToDoBuilder b) {
    //     b
    //       ..completed = false
    //       ..userId = 1
    //       ..id = index + 1
    //       ..title = 'Learn Provider${index + 1}';
    //     return b;
    //   });
    // }).toBuiltList();
    // tasksList = List<Task>.generate(5, (int index) {
    //   return Task((TaskBuilder b) {
    //     b
    //       ..toDosList = toDosLists.toBuilder()
    //       ..percentage = 80 + index
    //       ..noOfTasks = 10 + index
    //       ..taskName = 'Custom${index + 1}';
    //     return b;
    //   });
    // }).toBuiltList();
    compute();
  }

  void compute() async {
    tasksListFirestore = await cloudFirestoreInstance.getTasks();
    // toDosListFirestore = await cloudFirestoreInstance.getToDos();
    // print('ToDosList');
    // print(tasksListFirestore[0].toDosList);
    setState(() {
      isLoading = false;
    });
    // print(tasksListFirestore);
  }

  @override
  Widget build(BuildContext context) {
    // assert(tasksList != null);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            // ListTile(
            //   title: Text(
            //     'View DB',
            //     style: TextStyle(
            //       color: Theme.of(context).textTheme.subtitle2.color,
            //     ),
            //   ),
            //   onTap: () {
            //     final db = AppDatabase();
            //     Navigator.of(context).push(
            //       MaterialPageRoute<void>(builder: (BuildContext context) {
            //         return MoorDbViewer(db);
            //       }),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      backgroundColor: colors[colorIndex],
      appBar: AppBar(
        backgroundColor: colors[colorIndex],
        foregroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).iconTheme.color,
          size: Theme.of(context).iconTheme.size,
        ),
        title: Text(
          'TODO',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
            size: Theme.of(context).iconTheme.size,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: Text(
                        'Hello, John.',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Text(
                      'This is a daily quote.',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      'You have ${tasksListFirestore.length} tasks to do today.',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ].map((Widget child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 64,
                    vertical: 64,
                  ),
                  child: child,
                );
              }).toList(),
            ),
            Container(
              // color: Colors.blue,
              padding: const EdgeInsets.all(
                40.0,
              ),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : TasksCard(
                      tasksList: tasksListFirestore,
                      // toDosList: toDosListFirestore,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (BuildContext context) {
              return const FormsPage();
            }),
          );
          compute();
          // cloudFirestoreInstance.getToDos();
          // cloudFirestoreInstance.deleteDB();
          // cloudFirestoreInstance.createDB();
          // return;
        },
      ),
    );
  }
}

class TasksCard extends StatelessWidget {
  const TasksCard({
    Key key,
    this.tasksList,
    // this.toDosList,
  }) : super(key: key);
  final BuiltList<Task> tasksList;
  // final BuiltList<ToDo> toDosList;
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(
      initialPage: 0,
    );
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      // width: MediaQuery.of(context).size.width * 0.7,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: controller,
        itemCount: tasksList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (BuildContext context) {
                  return TasksPage(
                    tasksList: tasksList,
                    toDosList: tasksList[index].toDosList,
                    index: index,
                  );
                }),
              );
            },
            child: Card(
              color: Colors.white,
              // elevation: 5,
              // shadowColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.elliptical(
                    10,
                    10,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Icon(
                        Icons.more_vert,
                        color: Colors.black,
                        size: Theme.of(context).primaryIconTheme.size,
                      ),
                    ],
                  ),
                  Column(
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
                                value: tasksList[index].percentage.toDouble() /
                                    100,
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
                ].map((Widget child) {
                  return Padding(
                    child: child,
                    padding: const EdgeInsets.all(
                      20.0,
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
