class Todo{
  String? id;
  String? todoText;
  bool isDone;
  Todo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });
  static List<Todo> todoList(){
    return[
      Todo(id: '01', todoText: 'Subscribe my Channel codewithpeopl',),
      Todo(id: '02', todoText: 'My Name is Faiq Ahmad flutter app Developer',),
      Todo(id: '03', todoText: 'Welcome to My App',),



    ];
  }
}