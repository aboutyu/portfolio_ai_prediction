import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String get forMonthDay {
    return DateFormat.MMMd().format(this);
  }

  String get forYearMonthDay {
    return DateFormat.yMMMMd().format(this);
  }

  String get forHourMinute {
    return DateFormat('a h:mm').format(this);
  }
}
