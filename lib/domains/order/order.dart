import 'package:allfit_flutter/domains/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String userId,
    required String tailorId,
    required List<OrderItem> items,
    required Address address,
    required DateTime pickUpSchedule,
    String? extra,
    required String serviceCategory,
    required int deliveryFee,
    required int discount,
    DateTime? deliverySchedule,
    DateTime? paidAt,
    DateTime? finishedAt,
    DateTime? receivedAt,
    required DateTime createdAt,
    DateTime? rejectedAt,
    DateTime? deletedAt,
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

  String get status {
    if (receivedAt != null) {
      return "수령 완료";
    } else if (finishedAt != null) {
      return "배송 대기 중";
    }
    return "수선 대기 중";
  }

  String get substatus {
    if (receivedAt != null) {
      return "수선물을 확인해주세요.";
    } else if (finishedAt != null) {
      return "기사님을 기다리는 중입니다.";
    }
    return "수선 사장님이 물건을 확인 중입니다.";
  }

  List<OrderPoint> get allPoints {
    return items.fold(
      [],
      (previousValue, element) => previousValue..addAll(element.points),
    );
  }

  String get pointsSummary {
    final points = allPoints;
    return "${points.first.summary} 등 ${points.length}건";
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String category,
    required List<OrderPoint> points,
    String? imagePath,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
class OrderPoint with _$OrderPoint {
  const factory OrderPoint({
    required String part,
    required double value,
    required int cost,
  }) = _OrderPoint;

  const OrderPoint._();

  String get summary => "$part ${value}cm";

  factory OrderPoint.fromJson(Map<String, dynamic> json) =>
      _$OrderPointFromJson(json);
}
