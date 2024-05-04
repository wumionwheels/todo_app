// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

 final String taskName;
 final bool taskCompleted;
 Function(bool?)? onChanged;
 Function(BuildContext)? deleteFunction;


  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16,
        left: 16,
        right: 16
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete_rounded,
            backgroundColor: Colors.red.shade200,
            borderRadius: BorderRadius.circular(16),
          )]
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.centerLeft,
          width: 361,
          height: 64,
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), 
            color: Colors.blue[100]
          ),
        ),
      ),
    );
  }
}