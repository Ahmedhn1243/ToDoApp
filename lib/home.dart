import 'package:flutter/material.dart';
import "package:flutter_to_do_app/colors.dart";
import 'package:flutter_to_do_app/todo_items.dart';
import 'package:flutter_to_do_app/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();


}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo=[];

  final _todoController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        "All to dos",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    for (ToDo todoo in _foundToDo.reversed)
                      ToDoItems(
                        todo: todoo,
                        onToDoChange: _handleToDoChange,
                        onToDoDelete: _deleteToDo,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 15,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add new ToDo item',
                      border: InputBorder.none,
                    ),
                  ),
                )),

                Container(

                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 15,
                  ),

                  child: ElevatedButton(

                    onPressed: (){
                      _addToDoItem(_todoController.text);
                    },
                    child: Text('+', style: TextStyle(fontSize: 40),),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      minimumSize: Size(60,60),
                      elevation: 15,

                    ),

                  ),

                )
              ],
            ))
      ]),
    );
  }

  void _handleToDoChange(ToDo todo){


    setState(() {
      todo.isDone = !todo.isDone;
    });

  }

  void _deleteToDo( String id){

    setState(() {
      todosList.removeWhere((item) => item.id ==id);
    });

  }

  void _addToDoItem( String toDo){


    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), ToDoText: toDo));
    });

    _todoController.clear();

  }

  void _runFilter ( String enteredKeyword){

    List<ToDo> results=[];

    if(enteredKeyword.isEmpty){
      results=todosList;
    }
    else{
      results=todosList.where((item) => item.ToDoText!.toLowerCase().
      contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo=results;
    });

  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(

        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 25,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Container(
            height: 30,
            width: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar image'),
            ),
          )
        ],
      ),
    );
  }
}
