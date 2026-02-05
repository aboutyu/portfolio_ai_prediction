import 'package:intl/intl.dart';

extension IntExtension on int {
  String get toCommaString {
    return NumberFormat('###,###,###,###').format(this);
  }
}
