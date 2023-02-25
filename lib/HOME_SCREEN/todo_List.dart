import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/HOME_SCREEN/todo.dart';

class TodoList extends StatelessWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  const TodoList({Key? key,required this.todo, this.onToDoChanged, this.onDeleteItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),
        child:
        ListTile(
          onTap: (){
            onToDoChanged(todo);
          },
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ) ,
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical:5 ),
          tileColor: Colors.white,
          leading: Icon(
            todo.isDone ?
            Icons.check_box:Icons.check_box_outline_blank,color: Colors.blueAccent,),
          title: Text(todo.todoText!,style: TextStyle(fontSize: 16,color: Colors.black,decoration:todo.isDone? TextDecoration.lineThrough:null),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: Icon(Icons.delete),
              onPressed: () {
                onDeleteItem(todo.id);
              },

            ),
          ),
        ));
  }
}
