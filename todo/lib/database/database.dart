import 'package:hive_flutter/hive_flutter.dart';

//database to save data to the local device
class TodoDatabase{
  List todoList=[];

  final myBox = Hive.box('mybox');

  void CreateInitialData()
  {     todoList=[
      ['my task',false]
  ];

  }

  void loadData()
  { 
    todoList = myBox.get("TODOLIST");
  }

  void updateDatabase()
  {  
    myBox.put("TODOLIST", todoList);
  }
}