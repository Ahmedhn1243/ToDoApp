import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/todo.dart';

class ToDoItems extends StatelessWidget {

  final ToDo todo;
  final onToDoChange;
  final onToDoDelete;
  const ToDoItems ({Key ? key , required this.todo , required this.onToDoChange, required this.onToDoDelete} ) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {

          onToDoChange(todo);

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),

        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(todo.isDone ?Icons.check_box:Icons.check_box_outline_blank,color: Colors.blue,),
        title: Text(todo.ToDoText!,style: TextStyle(fontSize: 16 , color: Colors.black ,
            decoration: todo.isDone? TextDecoration.lineThrough:null), ),



        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),


          ),

          child: IconButton(color: Colors.white,
          iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {

            onToDoDelete(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
