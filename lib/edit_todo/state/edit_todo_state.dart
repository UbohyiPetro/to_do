
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTodoState {
  final RxBool isLoading = true.obs;
  final nameController = TextEditingController().obs;
  final status = 0.obs;
  final descriptionController = TextEditingController().obs;
  final isTypeWork = 0.obs;
  final isTypePrivate = 0.obs;
  final urgent = 0.obs;
  final finishDate = "".obs;
  final Rx<Uint8List?> file = Rx(null);
}