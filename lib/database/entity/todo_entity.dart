import 'package:floor/floor.dart';

@Entity(tableName: 'todos')
class TodoEntity {
  @PrimaryKey()
  final String taskId;
  final int status;
  final String name;
  final int type;
  final String description;
  final String file;
  final String finishDate;
  final int urgent;

  TodoEntity({
    required this.taskId,
    required this.status,
    required this.name,
    required this.type,
    required this.description,
    required this.file,
    required this.finishDate,
    required this.urgent,
  });
}
