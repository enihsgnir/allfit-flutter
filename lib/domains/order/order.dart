import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:allfit_flutter/domains/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required User user,
    required Tailor tailor,
    required List<OrderItem> items,
    required String address,
    required DateTime pickUpSchedule,
    String? extra,
    required String serviceCategory,
    required int deliveryFee,
    required int discount,
    DateTime? deliverySchedule,
    DateTime? paidAt,
    DateTime? receivedAt,
    required DateTime createdAt,
  }) = _Order;

  const Order._();

  int get alterCost {
    int cost = 0;
    for (final item in items) {
      for (final point in item.points) {
        cost += point.cost;
      }
    }
    return cost;
  }

  int get totalCost => alterCost + deliveryFee - discount;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required List<OrderPoint> points,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
class OrderPoint with _$OrderPoint {
  const factory OrderPoint({
    required String category,
    required double value,
    required int cost,
  }) = _OrderPoint;

  factory OrderPoint.fromJson(Map<String, dynamic> json) =>
      _$OrderPointFromJson(json);
}
