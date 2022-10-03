import 'package:intl/intl.dart';

String formatCurrency(int number) {
  return NumberFormat("#,###원").format(number);
}

String formatDateTime(DateTime dateTime) {
  return DateFormat("yyyy년 MM월 dd일 (E)", "ko_KR").format(dateTime);
}

String formatDateTimeDotted(DateTime dateTime) {
  return DateFormat("yyyy. MM. dd.").format(dateTime);
}

String formatDateTimeDottedWithHourAndMinute(DateTime dateTime) {
  return DateFormat("yyyy. MM. dd. HH시 mm분").format(dateTime);
}
