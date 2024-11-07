import 'package:softwars_to_do/api/model/task_api.dart';

class ResponseModel {
  final String? error;
  final List<TaskApi>? data;

  ResponseModel({
    required this.error,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    var data = json['data'] ?? [];
    return ResponseModel(
      error: json['error'],
      data: List.from(data)
          .map((jsonItem) => TaskApi.fromJson(jsonItem))
          .toList(),
    );
  }
}
