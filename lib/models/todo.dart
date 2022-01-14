import 'package:hive/hive.dart';
import 'package:modul6hive/screens/todo_list_screen.dart';
part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject{

  @HiveField(0)
  String? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  Todo({
    required this.title,
    required this.description,
  });
}