enum TaskStatus { completed, pending }

class TodoItem {
  String title;
  String description;
  TaskStatus status;
  bool flag;


  TodoItem({
    required this.title,
    required this.description,
    required this.status,
    required this.flag,
  });
}
