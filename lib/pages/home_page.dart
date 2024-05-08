// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/component/add_task_modal.dart';
import 'package:todo_app/component/todo_tile.dart';
import 'package:todo_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ToDoBase db = ToDoBase();

  // reference the hive box
  final _myBox = Hive.box('myBox');

  @override
  void initState() {
   if (_myBox.get("TODOLIST") == null) {
     db.createInitialData();
   } else {
    db.loadData();
   }



    super.initState();
  }


  // store what user typed
  final myController = TextEditingController();

  // added task
  

  // get what user typed
  void addTask() {
    String taskName = myController.text;
    setState(() {
       db.toDoList.add([taskName, false]);
       myController.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }


  // Create new task
  void createNewTask () {
    showDialog(
      context: context, builder: (context) {
        return AddTaskModal(
          controller: myController,
          onAddTask: addTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }


  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList [index] [1] = !db.toDoList [index] [1];
    });
    db.updateDatabase();
  }

  // delete task
  void deleteTask (int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          "ToDo App",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: createNewTask,
        elevation: 3,
        child: Icon(
          Icons.add_rounded,
          color: Colors.white
        ),

      ),
      body: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: db.toDoList.isEmpty? Center(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                    "Oops! your ToDo list is empty. " "Click on add button below to add a new task",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      letterSpacing: 1.5
                    ),
                    textAlign: TextAlign.center,
                  ),
            ),
          ),
        )
        :
        ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index] [0], 
              taskCompleted: db.toDoList[index] [1], 
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
            }
        )
      ),
      
    );
  }
}