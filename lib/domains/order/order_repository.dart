import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final orderRepository = OrderRepository();

class OrderRepository extends _OrderRepository {
  Future<List<Order>> getAllByUserId(String userId) async {
    final snapshot = await collection
        .where("userId", isEqualTo: userId)
        .orderBy("createdAt", descending: true)
        .get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<List<Order>> getAllPaid(
    String userId, {
    required int days,
  }) async {
    final snapshot = await collection
        .where("userId", isEqualTo: userId)
        .where(
          "paidAt",
          isGreaterThanOrEqualTo:
              DateTime.now().subtract(Duration(days: days)).toIso8601String(),
        )
        .orderBy("paidAt", descending: true)
        .get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}

abstract class _OrderRepository {
  final collection =
      FirebaseFirestore.instance.collection("order").withConverter<Order>(
    fromFirestore: (snapshot, _) {
      final data = Order.fromJson(
        snapshot.data()!..addAll({"id": snapshot.id}),
      );
      logger.v(data.toJson());
      return data;
    },
    toFirestore: (value, _) {
      final data = value.toJson()..remove("id");
      logger.v(data);
      return data;
    },
  );

  Future<List<Order>> getAll() async {
    final snapshot = await collection.get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<Order> getById(String id) async {
    final snapshot = await collection.doc(id).get();
    return snapshot.data()!;
  }

  Future<Order> createOne(Order data) async {
    final reference = await collection.add(data);
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<Order> updateOne(
    String id, {
    required Map<String, Object?> data,
  }) async {
    final reference = collection.doc(id);
    await reference.update(data..removeWhere((key, value) => value == null));
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<Order> removeOne(String id) async {
    final snapshot = await collection.doc(id).get();
    final data = snapshot.data()!;
    await collection.doc(id).delete();
    return data;
  }
}
