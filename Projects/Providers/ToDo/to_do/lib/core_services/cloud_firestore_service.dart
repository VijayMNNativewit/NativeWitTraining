import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/models/todo.dart';
import 'app_service.dart';

class CloudFirestoreService implements AppService {
  FirebaseFirestore database = FirebaseFirestore.instance;
  List<Task> tasksList = <Task>[];
  List<ToDo> toDosList = <ToDo>[];
  List<Task> tasksListPopulate = <Task>[];
  List<ToDo> toDosListPopulate = <ToDo>[];
  List<String> tasksId = <String>[];
  List<String> toDosId = <String>[];

  // Future<void> uploadStories(String uid, List<Story> updatedStories) async {
  //   try {
  //     final WriteBatch b = _fireStore.batch();
  //     await Future.wait<void>(updatedStories.map((Story element) async {
  //       final DocumentReference _doc = _storyRef.doc(element.id);
  //       final Map<String, dynamic> jsonMessage = element.toJson();
  //       b.set(
  //         _doc,
  //         jsonMessage,
  //       );
  //     }));
  //     await b.commit();
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  // void createDB() async {
  //   for (int iter = 1; iter < 6; iter++) {
  //     tasksId.add('Task$iter');
  //   }
  //   for (int iter = 1; iter < 11; iter++) {
  //     toDosId.add('ToDo$iter');
  //   }
  //   for (int iter = 1; iter < 6; iter++) {
  //     Task taskObj = Task((TaskBuilder b) {
  //       b
  //         ..noOfTasks = 10 + iter
  //         ..percentage = 80 + (iter * 2)
  //         ..taskName = 'Custom $iter';
  //       return b;
  //     });
  //     tasksListPopulate.add(taskObj);
  //     for (int secondIter = 1; secondIter < 11; secondIter++) {
  //       ToDo toDoObj = ToDo((ToDoBuilder b) {
  //         b
  //           ..id = secondIter
  //           ..userId = iter
  //           ..completed = false
  //           ..title = 'Do Complete Task $secondIter';
  //         return b;
  //       });
  //       toDosListPopulate.add(toDoObj);
  //     }
  //   }
  //   for (int iter = 0; iter < 5; iter++) {
  //     await database
  //         .collection('Tasks')
  //         .doc(tasksId[iter])
  //         .set(tasksListPopulate[iter].toJson());
  //     for (int secondIter = iter * 10;
  //         secondIter < 10 * (iter + 1);
  //         secondIter++) {
  //       await database
  //           .collection('Tasks')
  //           .doc(tasksId[iter])
  //           .collection('ToDosList')
  //           .doc(toDosId[secondIter])
  //           .set(toDosListPopulate[secondIter].toJson());
  //     }
  //   }
  //   print('Successful');
  // }
  //
  // Future<void> deleteDB() async {
  //   await database.collection('Tasks').get().then((snapshot) {
  //     for (final DocumentSnapshot ds in snapshot.docs) {
  //       ds.reference.delete();
  //     }
  //   });
  // }

  // Future<BuiltList<Task>> getTasks() async {
  //   QuerySnapshot<Map<String, dynamic>> tasksListFireStoreInstance =
  //       await database.collection('Tasks').get();
  //   List<QueryDocumentSnapshot<Map<String, dynamic>>> tasksIterList =
  //       tasksListFireStoreInstance.docs;
  //   for (var iter in tasksIterList) {
  //     tasksList.add(Task.fromJson(iter.data()));
  //   }
  //   return tasksList.toBuiltList();
  // }

  Future<BuiltList<Task>> getTasks() async {
    QuerySnapshot<Map<String, dynamic>> tasksListFireStoreInstance =
        await database.collection('Tasks').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> tasksIterList =
        tasksListFireStoreInstance.docs;
    for (var iter in tasksIterList) {
      print(iter.data());
      tasksList.add(Task.fromJson(iter.data()));
    }
    // print('TaskList');
    // print(tasksList);
    // print(tasksList.toBuiltList());
    return tasksList.toBuiltList();
  }

  @override
  Future<bool> deleteToDos(ToDo toDoItem) {
    // TODO: implement deleteToDos
    throw UnimplementedError();
    return null;
  }

  @override
  Future<BuiltList<ToDo>> getToDos() async {
    QuerySnapshot<Map<String, dynamic>> tasksListFirestoreInstance =
        await database.collection('Tasks').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> tasksIterList =
        tasksListFirestoreInstance.docs;
    for (var iter in tasksIterList) {
      QuerySnapshot<Map<String, dynamic>> toDosListFirestoreInstance =
          await database
              .collection('Tasks')
              .doc(iter.id)
              .collection('ToDosList')
              .get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> toDosIterList =
          toDosListFirestoreInstance.docs;
      for (var secondIter in toDosIterList) {
        toDosList.add(ToDo.fromJson(secondIter.data()));
      }
    }
    // print(toDosList.toBuiltList());
    return toDosList.toBuiltList();
  }

  @override
  Future<ToDo> postToDos(ToDo toDoItem) {
    // TODO: implement postToDos
    throw UnimplementedError();
  }

  Future<void> postToDosTasks(Task taskItem) async {
    // print('called');
    bool taskAlreadyExists = false;
    BuiltList<Task> fetchedTasksList = await getTasks();
    Task taskFromFirebase = Task();
    fetchedTasksList.forEach((Task element) {
      // print(element.taskName);
      if (element.taskName == taskItem.taskName) {
        taskAlreadyExists = true;
        taskFromFirebase = element;
      }
    });
    if (taskAlreadyExists) {
      taskFromFirebase = taskFromFirebase.rebuild((b) {
        b
          ..toDosList.addAll(taskItem.toDosList)
          ..noOfTasks += taskItem.noOfTasks;
        return b;
      });
      await database
          .collection('Tasks')
          .doc('${taskItem.taskName}')
          .set(taskFromFirebase.toJson());
    } else {
      await database
          .collection('Tasks')
          .doc('${taskItem.taskName}')
          .set(taskItem.toJson());
    }
  }

  Future<void> updateToDosTasks(Task taskItem, ToDo toDoItem) async {
    BuiltList<Task> fetchedTasksList = await getTasks();
    Task taskFromFirebase = Task();
    List<ToDo> fetchedToDosList = <ToDo>[];
    List<ToDo> updatedToDosList = <ToDo>[];
    fetchedTasksList.forEach((Task element) {
      if (element.taskName == taskItem.taskName) {
        taskFromFirebase = element;
        fetchedToDosList = element.toDosList.toList();
      }
    });
    fetchedToDosList.forEach((ToDo element) {
      if (element.id == toDoItem.id) {
        updatedToDosList.add(toDoItem);
      } else {
        updatedToDosList.add(element);
      }
    });
    Task updatedTask = Task((TaskBuilder b) {
      b
        ..toDosList.addAll(updatedToDosList)
        ..taskName = taskFromFirebase.taskName
        ..noOfTasks = taskFromFirebase.noOfTasks
        ..taskId = taskFromFirebase.taskId
        ..percentage = taskFromFirebase.percentage;
      return b;
    });
    await database
        .collection('Tasks')
        .doc('${taskItem.taskName}')
        .set(updatedTask.toJson());

    // await database.collection('Tasks').doc('${taskItem.taskName}').update({'toDosList': });
  }

  Future<void> deleteToDosTasks(Task taskItem, ToDo toDoItem) async {
    BuiltList<Task> fetchedTasksList = await getTasks();
    Task taskFromFirebase = Task();
    List<ToDo> fetchedToDosList = <ToDo>[];
    List<ToDo> updatedToDosList = <ToDo>[];
    fetchedTasksList.forEach((Task element) {
      if (element.taskName == taskItem.taskName) {
        taskFromFirebase = element;
        fetchedToDosList = element.toDosList.toList();
      }
    });
    fetchedToDosList.forEach((ToDo element) {
      if (element.id == toDoItem.id) {
        // updatedToDosList.add(toDoItem);
      } else {
        updatedToDosList.add(element);
      }
    });
    Task updatedTask = Task((TaskBuilder b) {
      b
        ..toDosList.addAll(updatedToDosList)
        ..taskName = taskFromFirebase.taskName
        ..noOfTasks = taskFromFirebase.noOfTasks - 1
        ..taskId = taskFromFirebase.taskId
        ..percentage = taskFromFirebase.percentage;
      return b;
    });
    await database
        .collection('Tasks')
        .doc('${taskItem.taskName}')
        .set(updatedTask.toJson());
  }

  @override
  Future<ToDo> updateToDos(ToDo toDoItem) {
    // database
    //     .collection('Tasks')
    //     .doc('Task1')
    //     .collection('ToDosList')
    //     .doc('ToDo${toDoItem.id}')
    //     .set(toDoItem.toJson());
  }
}
