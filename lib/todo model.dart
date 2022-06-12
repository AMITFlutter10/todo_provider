import 'package:flutter/material.dart';

class TodoModel{
  String task;
  bool done;
  bool AnyOneDone = false;
  TextEditingController itemController = TextEditingController();
  TodoModel({required this.task, required this.done});
}