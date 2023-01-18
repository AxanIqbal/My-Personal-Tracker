import 'package:intl/intl.dart';

extension DateFormatX on DateTime {
  bool compareMonth(DateTime date) {
    final dateFormat = DateFormat("yyyy-MM");
    return dateFormat.format(this) == dateFormat.format(date);
  }
}
