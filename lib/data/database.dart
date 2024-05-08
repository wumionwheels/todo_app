import 'package:hive/hive.dart';

class ToDoBase {
  // list of todo tasks
  List toDoList = [];


  // reference the hive box
  final _myBox = Hive.box('myBox');


  // create data
  void createInitialData() {
    toDoList = [];
  }

  // load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update database

  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }




}