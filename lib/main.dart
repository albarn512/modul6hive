import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:modul6hive/boxes.dart';
import 'package:modul6hive/screens/todo_list_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/todo.dart';

void main() async{
  Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>(HiveBoxex.todo);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: TodoListScreen(
        title: 'Todo Listing',
      ),
    );
  }
}