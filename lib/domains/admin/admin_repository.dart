import 'package:allfit_flutter/domains/admin/admin.dart';
import 'package:allfit_flutter/utils/extensions.dart';
import 'package:allfit_flutter/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final adminRepository = AdminRepository();

class AdminRepository extends _AdminRepository {
  Future<Admin?> getByAuthUid(String uid) async {
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

abstract class _AdminRepository {
  final collection =
      FirebaseFirestore.instance.collection("admin").withConverter<Admin>(
    fromFirestore: (snapshot, _) {
      final data = Admin.fromJson(
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

  Future<Admin> createOne(Admin data) async {
    final reference = await collection.add(data);
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<Admin> removeOne(String id) async {
    final snapshot = await collection.doc(id).get();
    final data = snapshot.data()!;
    await collection.doc(id).delete();
    return data;
  }
}
