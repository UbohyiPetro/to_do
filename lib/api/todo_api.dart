import 'package:dio/dio.dart';
import 'package:softwars_to_do/api/model/task_api.dart';

import 'model/response.dart';

const baseUrl = 'https://to-do.softwars.com.ua/petroubohyi/tasks/';

class TodoApi {
  final Dio _dio = Dio();

  Future<List<TaskApi>> fetchTasks() async {
    try {
      final response = await _dio.get(baseUrl);
      if (response.statusCode != 200) {
        throw Exception(
            "Failed to fetch tasks with code ${response.statusCode}");
      }
      ResponseModel responseModel = ResponseModel.fromJson(response.data);
      if (responseModel.error != null) {
        throw Exception(
            "Failed to fetch tasks with following error ${responseModel.error}");
      }
      return responseModel.data!;
    } catch (e) {
      rethrow;
    }
  }

  void upsertTask(TaskApi task) async {
    try {
      final response = await _dio.post(baseUrl,
          options: Options(
            contentType: 'application/json',
          ),
          data: [task]);
    } catch (e) {
      rethrow;
    }
  }

  void updateStatus(String id, int status) async {
    try {
      final response = await _dio.put('$baseUrl$id',
          options: Options(
            contentType: 'application/json',
          ),
          data: {"status": status});
    } catch (e) {
      rethrow;
    }
  }

  void deleteTask(String id) async {
    try {
      final response = await _dio.delete('$baseUrl$id');
    } catch (e) {
      rethrow;
    }
  }
}
