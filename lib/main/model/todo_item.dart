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

  TodoItem copyWith(
      {String? taskId,
      int? status,
      String? name,
      int? type,
      String? description,
      String? file,
      DateTime? finishDate,
      int? urgent}) {
    return TodoItem(
      taskId: taskId ?? this.taskId,
      status: status ?? this.status,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      file: file ?? this.file,
      finishDate: finishDate ?? this.finishDate,
      urgent: urgent ?? this.urgent,
    );
  }
}
