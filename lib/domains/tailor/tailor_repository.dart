import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final tailorRepository = TailorRepository();

class TailorRepository extends _TailorRepository {
  Future<Tailor?> getByAuthUid(String uid) async {
    final snapshot = await collection
        .where(
          "authUid",
          isEqualTo: uid,
        )
        .limit(1)
        .get();
    return snapshot.docs.firstOrNull?.data();
  }
}

abstract class _TailorRepository {
  final collection =
      FirebaseFirestore.instance.collection("tailor").withConverter<Tailor>(
    fromFirestore: (snapshot, _) {
      final data = Tailor.fromJson(
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

  Future<List<Tailor>> getAll() async {
    final snapshot = await collection.get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<Tailor> getById(String id) async {
    final snapshot = await collection.doc(id).get();
    return snapshot.data()!;
  }

  Future<Tailor> createOne(Tailor data) async {
    final reference = await collection.add(data);
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<Tailor> updateOne(
    String id, {
    required Map<String, Object?> data,
  }) async {
    final reference = collection.doc(id);
    await reference.update(data..removeWhere((key, value) => value == null));
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<Tailor> removeOne(String id) async {
    final snapshot = await collection.doc(id).get();
    final data = snapshot.data()!;
    await collection.doc(id).delete();
    return data;
  }
}
