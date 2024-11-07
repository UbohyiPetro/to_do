class TaskApi {
  final String taskId;
  final int status;
  final String name;
  final int type;
  final String description;
  final String file;
  final String finishDate;
  final int urgent;

  TaskApi({
    required this.taskId,
    required this.status,
    required this.name,
    required this.type,
    required this.description,
    required this.file,
    required this.finishDate,
    required this.urgent,
  });

  Map<String, dynamic> toJson() {
    return {
      'taskId': taskId,
      'status': status,
      'name': name,
      'type': type,
      'description': description,
      'file': file,
      'finishDate': finishDate,
      'urgent': urgent,
    };
  }

  factory TaskApi.fromJson(Map<String, dynamic> json) {
    return TaskApi(
      taskId: json['taskId'],
      status: json['status'],
      name: json['name'],
      type: json['type'],
      description: json['description'],
      file: json['file'],
      finishDate: json['finishDate'],
      urgent: json['urgent'],
    );
  }
}
