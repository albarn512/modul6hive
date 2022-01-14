import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:modul6hive/boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:modul6hive/models/todo.dart';
import 'add_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  final String title;
  const TodoListScreen({Key? key, required this.title}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  void dispose(){
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Todo>(HiveBoxex.todo).listenable(),
        builder: (context, Box<Todo> box, _){
          if(box.values.isEmpty){
            return Center(
              child: Text('Todo listing is Empty'),
            );
          }
          return ListView.builder(
            itemCount: box.values.length,
            itemBuilder: (context, index){
              Todo? res = box.getAt(index);
              return Dismissible(
                background: Container(
                  color: Colors.red,
                ),
                key: UniqueKey(),
                onDismissed: (direction){
                  res!.delete();
                },
                child: ListTile(
                  title: Text(res!.title),
                  subtitle: Text(res!.description),
                ),
              );
            },
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
        onPressed: ()=>{
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)=> AddTodoScreen(),
              ))
        },
      ),
    );
  }
}

