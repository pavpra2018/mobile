class Task {
  final String title;
  bool isDone;

  Task({required this.title, required this.isDone});

  void toggleIsDone() {
    isDone = !isDone;
  }
}
