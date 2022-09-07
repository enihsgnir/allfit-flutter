import 'package:allfit_flutter/domains/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userRepository = UserRepository();

class UserRepository {
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

  Future<User> createOne({
    required String name,
    required String email,
    String? phone,
    Gender? gender,
    String? address,
  }) async {
    final reference = await collection.add(
      User(
        id: "",
        name: name,
        email: email,
        phone: phone,
        gender: gender,
        address: address,
        createdAt: DateTime.now(),
      ),
    );
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<User> updateOne(
    String id, {
    String? name,
    String? email,
    String? phone,
    Gender? gender,
    String? address,
  }) async {
    final reference = collection.doc(id);
    await reference.update(
      {
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender?.name,
      }..removeWhere((key, value) => value == null),
    );
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<User> removeOne(String id) async {
    final snapshot = await collection.doc(id).get();
    final user = snapshot.data()!;
    await collection.doc(id).delete();
    return user;
  }
}
