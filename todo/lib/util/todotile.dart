// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget{
   final String taskName;
   final bool taskCompleted;
   Function(bool?)? onChanged;
   Function(BuildContext) deleteFunction;


   Todotile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
});

  


  Widget build(BuildContext build)
  {    return Padding(
       padding: EdgeInsets.only(left: 24,right: 24,top: 24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 226, 115, 115),)
          ]),
       child: Container(
       child:Row(
       
       children: [
       
       Checkbox(value: taskCompleted, 
       onChanged: onChanged,
       activeColor:  const Color.fromARGB(255, 180, 153, 186),
       ),
       
       Text(taskName,
      style: TextStyle(
        decoration: taskCompleted? TextDecoration.lineThrough:TextDecoration.none,),),
      ] ),
       decoration: BoxDecoration(color: const Color.fromARGB(255, 115, 84, 121),
       borderRadius: BorderRadius.circular(12)),
       padding: EdgeInsets.all(24)),), );}

       
}