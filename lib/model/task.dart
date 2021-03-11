class Task {
  final int id;
  final String title;
  final bool completed;
  Task({
    this.id,
    this.title,
    this.completed = false,
  });

  Task copyWith({int id, String title, bool completed}) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
