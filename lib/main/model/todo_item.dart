class TodoItem {
  final String id;
  final int status;
  final String name;
  final int type;
  final String description;
  final int finishDate;
  final int urgent;

  TodoItem({
    required this.id,
    required this.status,
    required this.name,
    required this.type,
    required this.description,
    required this.finishDate,
    required this.urgent,
  });
}
