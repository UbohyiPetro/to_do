import 'package:flutter/material.dart';

void pickDate(BuildContext context, DateTime initialDate,
    Function(DateTime) onDateSelect) {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1970),
    lastDate: DateTime(2090),
  ).then((value) {
    if (value != null) {
      onDateSelect(value);
    }
  });
}
