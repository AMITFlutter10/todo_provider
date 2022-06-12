
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test1/providers/counter%20provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterProvider>(
              builder:(context,value,child)=> Text(
                '${value.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<CounterProvider>(
        builder:(_,v,c)=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: (){
                v.increment();
                //context.read<CounterProvider>().increment();
                //context.watch()
              },

              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: (){
                v.decrement();
                //context.read<CounterProvider>().increment();
                //context.watch()
              },

              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
