import 'package:allfit_flutter/domains/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userRepository = UserRepository();

class UserRepository extends _UserRepository {}

abstract class _UserRepository {
  final collection =
      FirebaseFirestore.instance.collection("user").withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromJson(
              snapshot.data()!..addAll({"id": snapshot.id}),
            ),
            toFirestore: (value, _) => value.toJson()..remove("id"),
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
