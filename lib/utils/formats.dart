import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime dateOnly() => DateTime(year, month, day);
}

String formatCurrency(int number) {
  return NumberFormat("#,###원").format(number);
}

String formatDateTime(DateTime dateTime) {
  return DateFormat("yyyy년 MM월 dd일").format(dateTime);
}

String formatDateTimeDotted(DateTime dateTime) {
  return DateFormat("yyyy. MM. dd.").format(dateTime);
}
