import 'package:allfit_flutter/domains/user/user.dart';
import 'package:allfit_flutter/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userRepository = UserRepository();

class UserRepository extends _UserRepository {
  Future<User> getByAuthUid(String uid) async {
    final snapshot =
        await collection.where("authUid", isEqualTo: uid).limit(1).get();
    return snapshot.docs.first.data();
  }

  Future<User> updateAddress(String id, String address) async {
    return updateOne(
      id,
      data: {
        "address": address,
      },
    );
  }

  Future<User> withdraw(String id) async {
    return updateOne(
      id,
      data: {
        "name": null,
        "phone": null,
        "address": null,
        "wayToEnter": null,
        "deletedAt": DateTime.now().toIso8601String(),
      },
    );
  }
}

abstract class _UserRepository {
  final collection =
      FirebaseFirestore.instance.collection("user").withConverter<User>(
    fromFirestore: (snapshot, _) {
      final data = User.fromJson(
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

  Future<List<User>> getAll() async {
    final snapshot = await collection.get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<User> getById(String id) async {
    final snapshot = await collection.doc(id).get();
    return snapshot.data()!;
  }

  Future<User> createOne(User data) async {
    final reference = await collection.add(data);
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<User> updateOne(
    String id, {
    required Map<String, Object?> data,
  }) async {
    final reference = collection.doc(id);
    await reference.update(data..removeWhere((key, value) => value == null));
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<User> removeOne(String id) async {
    final snapshot = await collection.doc(id).get();
    final data = snapshot.data()!;
    await collection.doc(id).delete();
    return data;
  }
}
