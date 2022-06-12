import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/todo%20provider.dart';
import 'package:test1/screens/update.dart';
import 'package:test1/todo%20model.dart';


class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  //_TodosScreenState createState() => _TodosScreenState();
  _TodosScreenState createState() {homeState =_TodosScreenState(); return homeState;}
}
var homeState;
class _TodosScreenState extends State<TodosScreen> {
  TextEditingController todoController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  //List<TextEditingController>? _controllers; //= new List.filled(0,new TextEditingController,growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Todos"),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: TextField(
                  controller: todoController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: "Enter Todo"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    TodoModel t =
                        TodoModel(task: todoController.text, done: false);
                    context.read<TodoProvider>().addToTodos(t);
                  },
                  child: Text("add")),
              Consumer<TodoProvider>(
                builder: (_, value, c) =>
                    ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.allTodos.length,
                  itemBuilder: (context, index) {
                    //_controllers?.add(new TextEditingController());

                      return Padding(
                    padding: EdgeInsets.all(10),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: value.allTodos[index].AnyOneDone,
                                  onChanged: (V){
                                    context.read<TodoProvider>().AnyOnedoneFromTodos(index,V!);
                                    //value.allTodos[index].AnyOneDone = true;
                                  }),
                              Text("  ${value.allTodos[index].task}"),
                              (value.allTodos[index].done)
                                  ? Text("Done")
                                  : Text(""),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<TodoProvider>()
                                  .deleteFromTodos(index);
                            },
                            child: Text("Delete"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<TodoProvider>().doneFromTodos(index);
                            },
                            child: Text("Finish"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                          ),

                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateScreen(index: index),
                                  ));
                            },
                            child: Text("update"),
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.blue)
                          )
                          //   //onPressed: () {
                          //     // context
                          //     //     .read<TodoProvider>()
                          //     //     .deleteFromTodos(index);
                          //     //_controllers?[index].text = "  ${value.allTodos[index].task}";
                          //   //},
                          //   child: Text("Update"),
                          //   style:
                          //       ElevatedButton.styleFrom(primary: Colors.blue),
                          // ),
                          // Container(
                          //   child: TextFormField(
                          //     //controller: value.allTodos[index].itemController,
                          //     //controller: itemController,
                          //   ),
                          // )

                        ],
                      ),
                    )),
                  );


                  }
                  ,
                ),

              )
              ,

            ],
          ),
        ),
      ),

      floatingActionButton: Consumer<TodoProvider>(
        builder:(_,v,c)=> Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (context.read<TodoProvider>().GetAllAnyOneChecked()) ?
            FloatingActionButton(
              onPressed: (){
                context.read<TodoProvider>().DoneAllChecked();
                //context.read<CounterProvider>().increment();
                //context.watch()
              },

              child: const Icon(Icons.add),
            )
            : Text(""),
          ],
        ),

      )


    );
  }
}
