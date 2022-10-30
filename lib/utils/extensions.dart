import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime dateOnly() => DateTime(year, month, day);
}

extension IfNotNullExtension<T> on T? {
  S? andThen<S>(S Function(T value) function) {
    final self = this;
    return self == null ? null : function(self);
  }
}

extension IterableExtension<T> on Iterable<T?> {
  T? get firstOrNull => isEmpty ? null : first;
}

extension NumberFormatExtension on int {
  String toFormatted({bool printUnit = true}) {
    final format = printUnit ? NumberFormat("#,###원") : NumberFormat("#,###");
    return format.format(this);
  }
}

extension DateFormatExtension on DateTime {
  String toFormatted({
    bool isDotSeparated = false,
    bool printWeekday = true,
    bool printHourMinute = false,
    bool printAmPm = false,
  }) {
    final format = isDotSeparated
        ? DateFormat("yyyy. MM. dd.")
        : DateFormat("yyyy년 MM월 dd일", "ko_KR");
    if (printWeekday) {
      format.addPattern("(E)");
    }
    if (printHourMinute) {
      if (printAmPm) {
        format.addPattern("aa hh시 mm분");
      } else {
        format.addPattern("HH시 mm분");
      }
    }
    return format.format(this);
  }
}
