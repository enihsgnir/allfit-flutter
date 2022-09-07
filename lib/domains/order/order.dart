import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:allfit_flutter/domains/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required User user,
    required Tailor tailor,
    required int price,
    required DateTime arrivedUntil,
    required DateTime createdAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
