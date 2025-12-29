import 'package:app/helpers/commons/pretendard.dart';
import 'package:flutter/material.dart';

AppBar appBarWidget(String title, {List<Widget>? actions}) {
  return AppBar(
    title: appBarText(title),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1,
    actions: actions,
  );
}

AppBar appBarWidgetCalendar(
  BuildContext context,
  String title,
  DateTime date,
  void Function(DateTime) onDateSelected,
) {
  return appBarWidget(
    title,
    actions: [
      IconButton(
        icon: const Icon(Icons.calendar_month),
        color: Colors.grey,
        onPressed: () async {
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2025, 1, 1),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    onSurface: Colors.black,
                  ),
                ),
                child: child!,
              );
            },
          );

          if (selectedDate != null) {
            onDateSelected(selectedDate);
          }
        },
      ),
    ],
  );
}

Text appBarText(String text) {
  return Text(text, style: Pretendard.semiBold(size: 18, color: Colors.black));
}
