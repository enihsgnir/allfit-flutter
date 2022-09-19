import 'package:allfit_flutter/domains/user/user.dart';
import 'package:intl/intl.dart';

extension CurrencyExtension on int {
  String toCurrencyString() {
    return "";
  }
}

String formatCurrency(int number) {
  return NumberFormat("#,###원").format(number);
}

String usernameFromEmail(User? user) {
  if (user == null) {
    return "(알 수 없음)";
  }

  final name = user.name;
  if (name != null) {
    return name;
  }

  final email = user.email;
  return email.split("@")[0];
}

String formatDateTime(DateTime dateTime) {
  return DateFormat("yyyy년 MM월 dd일").format(dateTime);
}
