import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTodoState {
  RxInt urgent = RxInt(0);
  RxInt isTypeWork = RxInt(0);
  RxInt isTypePrivate = RxInt(1);
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
}