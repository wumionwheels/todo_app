// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:todo_app/component/cancel_button.dart';
import 'package:todo_app/component/primary_button.dart';


class AddTaskModal extends StatelessWidget {
  final controller;
  VoidCallback onAddTask;
  VoidCallback onCancel;

  AddTaskModal({
    super.key,
    required this.controller,
    required this.onAddTask,
    required this.onCancel,
   });


  


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 361,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Create a New Task",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
              
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Type your task...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CancelButton(
                    text: "Cancel", 
                    onPressed: onCancel
                  ),
                  PrimaryButton(
                    text: "Add Task", 
                    onPressed: onAddTask
                  ),
                ],
              )
            ],
          ),
        ),
      );
    
  }
}