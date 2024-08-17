import 'package:flutter/material.dart';
import 'package:todo/package/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{ 
   await Hive.initFlutter();
   // the below command is used for creating a local datbase on the device
   await Hive.openBox('mybox');  
  
  runApp(TodoApp());
 }


//main app
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  Widget build(BuildContext context)
  {   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Homepage(),
     theme: ThemeData(primarySwatch: Colors.purple),
  );  }
}