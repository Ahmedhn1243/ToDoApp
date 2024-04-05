class ToDo {
  String ? id;
  String ? ToDoText;
  bool isDone;


  ToDo({

    required this.id,
    required this.ToDoText,
    this.isDone = false,

  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', ToDoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', ToDoText: 'Buy Groceries', isDone: true),
      ToDo(id: '03', ToDoText: 'Check emails', ),
      ToDo(id: '04', ToDoText: 'Work on projetcs', ),
      ToDo(id: '04', ToDoText: 'Work on projetcs', ),
      ToDo(id: '04', ToDoText: 'Work on projetcs', ),
      ToDo(id: '04', ToDoText: 'Work on projetcs', ),

    ];
  }

}