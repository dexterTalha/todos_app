class TodoModel {
  String title;
  int userId, id;
  bool completed;
  TodoModel({this.completed, this.id, this.title, this.userId});

  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      completed: map['completed'],
      id: map['id'],
      title: map['title'],
      userId: map['userId'],
    );
  }
}
