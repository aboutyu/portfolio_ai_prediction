import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class AppbarCalendarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarCalendarWidget({
    super.key,
    required this.title,
    required this.date,
    required this.onDateSelected,
  });

  final String title;
  final DateTime date;
  final void Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: title,
      actions: [
        IconButton(
          icon: const Icon(Icons.calendar_month),
          color: Colors.grey,
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: firstCalendarDate,
              lastDate: lastCalendarDate,
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
