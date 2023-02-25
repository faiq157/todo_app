import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/HOME_SCREEN/todo.dart';
import 'package:todoapp/HOME_SCREEN/todo_List.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  final todoController = TextEditingController();
  List<Todo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _AppBar(),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
              child: Column(
                children: [
                  SearchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Column(
                            children: [
                              Text(
                                "All ToDos",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Add Your ToDo List"),
                              )
                            ],
                          ),
                        ),
                        for (Todo todoo in _foundToDo)
                          TodoList(
                              todo: todoo,
                              onToDoChanged: _handleToDoChange,
                              onDeleteItem: _handleToDoDelete),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: todoController,
                      decoration: InputDecoration(
                        hintText: "Add New tod Item",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addToDoItem(todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(Todo todo) {
    setState(() {});
    todo.isDone = !todo.isDone;
  }

  void _handleToDoDelete(String id) {
    setState(() {});
    todosList.removeWhere((item) => item.id == id);
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
    });
    todoController.clear();
  }

  void _runfilter(String EnteredKeyword) {
    List<Todo> result = [];
    if (EnteredKeyword.isEmpty) {
      result = todosList;
    } else {
      result = todosList
          .where((item) => item.todoText!
          .toLowerCase()
          .contains(EnteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = result;
    });
  }

  Container SearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runfilter(value),
        decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: 2.0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 25,
            )),
      ),
    );
  }

  AppBar _AppBar() {
    return AppBar(
      backgroundColor: Colors.grey[200],
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          Container(
              height: 60,
              width: 60,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/9472/9472986.png",
                  )))
        ],
      ),
    );
  }
}
