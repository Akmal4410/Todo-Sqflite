class Task {
  final String name;
  bool isFinished;

  Task({
    required this.name,
    this.isFinished = false,
  });

  void isTaskFinished() {
    isFinished = !isFinished;
  }

  static Task fromJson(Map<String, Object?> map) {
    final isFinished = map['isFinished'] as int;
    return Task(
      name: map['name'] as String,
      isFinished: (isFinished == 1) ? true : false,
    );
  }
}
