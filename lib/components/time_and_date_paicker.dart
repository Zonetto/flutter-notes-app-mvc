import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<String> timePicker({
  required BuildContext context,
}) async {
  final TimeOfDay? newTime = await showTimePicker(
    initialEntryMode: TimePickerEntryMode.dialOnly,
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (newTime != null) {
    final String time = newTime.format(context);
    return time;
  }
  return '';
}

Future<String> datePicker({required BuildContext context}) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1950),
    lastDate: DateTime(2050),
  );

  if (pickedDate != null) {
    final String formattedDate = DateFormat.yMMMd().format(pickedDate);
    return formattedDate;
  }
  return '';
}
