class TodoItem {
  final String taskId;
  int status;
  final String name;
  final int type;
  final String description;
  final String file;
  final DateTime finishDate;
  final int urgent;

  TodoItem({
    required this.taskId,
    required this.status,
    required this.name,
    required this.type,
    required this.description,
    required this.file,
    required this.finishDate,
    required this.urgent,
  });

  @override
  String toString() {
    return '$taskId\n$status\n$name\n$description\n$type\n$file\n$finishDate\n$urgent';
  }
}
