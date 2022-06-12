import 'package:flutter/cupertino.dart';

import '../todo model.dart';

class TodoProvider extends ChangeNotifier{
  List<TodoModel> allTodos = [];

  UpdateTask(int index, String p_Task)
  {
    allTodos[index].task=p_Task;
    notifyListeners();
  }

  addToTodos(TodoModel todo){
    allTodos.add(todo);
    notifyListeners();
  }
  deleteFromTodos(int index){
    allTodos.removeAt(index);
    notifyListeners();
  }
  doneFromTodos(int index){
    allTodos[index].done = true;
    notifyListeners();
  }

  AnyOnedoneFromTodos(int index, bool value){
    allTodos[index].AnyOneDone = value;
    notifyListeners();
  }

  DoneAllChecked(){
    for(int i = 0 ; i < allTodos.length; i++)
      {
        if(allTodos[i].AnyOneDone)
          {
            allTodos[i].done = true;
          }

      }
    notifyListeners();
  }

  bool GetAllAnyOneChecked()
  {
    for(int i = 0 ; i < allTodos.length; i++)
    {
      if(allTodos[i].AnyOneDone)
      {
        return true;
      }

    }
    return false;
  }
}