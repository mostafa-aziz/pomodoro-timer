import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get monthName => DateFormat('MMMM').format(this);

  String get dayAndMonthName => ' $day.${DateFormat('MMMM').format(this)}';
}
