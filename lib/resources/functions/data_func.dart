import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<DateTime?> showDatePickerFunction(
    BuildContext context, TextEditingController dateController) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1950),
    lastDate: DateTime(2025),
  );

  if (selectedDate != null) {
    final formatter = DateFormat('yyyy/MM/dd');
    final formattedDate = formatter.format(selectedDate);
    dateController.text = formattedDate;
  }

  return selectedDate;
}
