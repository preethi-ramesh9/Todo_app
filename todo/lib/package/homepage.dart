import 'package:flutter/material.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todotile.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/database/database.dart';


class Homepage extends StatefulWidget{
 Homepage({super.key});
  

  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage>{
  final _controller=TextEditingController();
  final myBox = Hive.box('mybox');
  
  //database initialization
  void initState(){
    super.initState();
    if (myBox.get("TODOLIST")==null){
       db.CreateInitialData();
    }
    else{
      db.loadData();
    }
  }

  TodoDatabase db=TodoDatabase();
  
  //function to save new task
  void Savenewtask(){
   setState(() {
     db.todoList.add( [_controller.text,false]);
   });  
   Navigator.of(context).pop();
   db.updateDatabase();
  }
  //function to change check box state
  void CheckboxChange(bool?  value,int index){
    setState(() {
      db.todoList[index][1]=!db.todoList[index][1];
    });
    db.updateDatabase();
  }
  
  //function to create new task
  void createNewTask()
  {  showDialog(context: context,
      builder: (context){ 
        return DialogBox(
           controller: _controller,
           onSave: Savenewtask,
           onCancel: () =>Navigator.of(context).pop());},
        );
     }
  
  //function to delete a task
  void deleteTask(int index)
  {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }


  //returns homepage of the app
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
        backgroundColor:  const Color.fromARGB(255, 115, 84, 121),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      backgroundColor:  const Color.fromARGB(255, 180, 153, 186),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        ),
      //list view of tasks
      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder:(context, index) {
            return Todotile(
          taskName: db.todoList[index][0],
          taskCompleted: db.todoList[index][1],
          onChanged: (value) => CheckboxChange(value,index ) ,
          deleteFunction: (context) => deleteTask(index), ); 
          },
         
        )
      );
  }
}