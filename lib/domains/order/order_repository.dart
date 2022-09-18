import 'package:allfit_flutter/domains/order/order.dart';
import 'package:allfit_flutter/domains/user/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderRepository extends _OrderRepository {
  Future<List<Order>> getAllByUserId(String userId) async {
    final snapshot = await collection
        .where(
          "user",
          isEqualTo: userRepository.collection.doc(userId),
        )
        .get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<List<Order>> getAllPaid(String userId) async {
    final snapshot = await collection
        .where(
          "user",
          isEqualTo: userRepository.collection.doc(userId),
        )
        .where(
          "createdAt",
          isGreaterThanOrEqualTo:
              DateTime.now().subtract(const Duration(days: 90)),
        )
        .get();
    return snapshot.docs.map((e) => e.data()).toList();
  }
}

abstract class _OrderRepository {
  final collection =
      FirebaseFirestore.instance.collection("order").withConverter<Order>(
            fromFirestore: (snapshot, _) => Order.fromJson(
              snapshot.data()!..addAll({"id": snapshot.id}),
            ),
            toFirestore: (value, _) => value.toJson()..remove("id"),
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
