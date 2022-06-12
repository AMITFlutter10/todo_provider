
import 'package:flutter/material.dart';

//import 'data.dart';

import 'package:provider/provider.dart';
import 'package:test1/providers/todo%20provider.dart';

class UpdateScreen extends StatefulWidget {
  final int index;
  const UpdateScreen({Key? key,required this.index}) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController updateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    updateController.text = context.read<TodoProvider>().allTodos[widget.index].task; //todos[widget.index].title;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                child: TextField(
                  controller: updateController,
                ),
              ),
              ElevatedButton(onPressed: (){
                //context.read<TodoProvider>().allTodos[widget.index].task = updateController.text;
                context.read<TodoProvider>().UpdateTask(widget.index,updateController.text);
              //homeState.setState((){});
              Navigator.pop(context);
              }, child: Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
































// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:todo_flutter_17/start.dart';
//
// import 'data.dart';
//
// class Update extends StatefulWidget {
//   final int todoTitle;
//   const Update({Key? key, required this.todoTitle}) : super(key: key);
//
//   @override
//   _UpdateState createState() => _UpdateState();
// }
//
// class _UpdateState extends State<Update> {
//   TextEditingController todoController = TextEditingController();
//   double w = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer t = Timer.periodic(Duration(seconds: 1), (timer) {
//       if(w == 0){
//         w = 500;
//       }else{
//         w = 0;
//       }
//       setState(() {
//       });
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     todoController.text = todos[widget.todoTitle].title;
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 300,
//                 child: TextField(
//                   controller: todoController,
//                 ),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
