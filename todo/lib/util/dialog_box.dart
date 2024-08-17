// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget{
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel});
  
  //creates a floating tab to input new task
  Widget build(BuildContext context)
  {   return AlertDialog(
        backgroundColor:   const Color.fromARGB(255, 180, 153, 186),
        content: Container( 
          height: 140,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  fillColor: const Color.fromARGB(255, 115, 84, 121),
                  hintText: "Add a new task"
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                MyButton(text: "Save", onPressed: onSave),

                SizedBox(width: 30,height: 16),

                MyButton(text: "Cancel", onPressed: onCancel),
                
              ],),
            ],
          ),
        ),  
  );}
}