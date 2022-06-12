import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/screens/todos.dart';
import 'providers/counter provider.dart';
import 'providers/todo provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context) => TodoProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const TodosScreen(),
      ),
    );
  }
}
