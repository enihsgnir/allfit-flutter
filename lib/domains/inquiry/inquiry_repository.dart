import 'package:allfit_flutter/domains/inquiry/inquiry.dart';
import 'package:allfit_flutter/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final inquiryRepository = InquiryRepository();

class InquiryRepository extends _InquiryRepository {}

abstract class _InquiryRepository {
  final collection =
      FirebaseFirestore.instance.collection("inquiry").withConverter<Inquiry>(
    fromFirestore: (snapshot, _) {
      final data = Inquiry.fromJson(
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

  Future<List<Inquiry>> getAll() async {
    final snapshot = await collection.get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  Future<Inquiry> getById(String id) async {
    final snapshot = await collection.doc(id).get();
    return snapshot.data()!;
  }

  Future<Inquiry> createOne(Inquiry data) async {
    final reference = await collection.add(data);
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<Inquiry> updateOne(
    String id, {
    required Map<String, Object?> data,
  }) async {
    final reference = collection.doc(id);
    await reference.update(data..removeWhere((key, value) => value == null));
    final snapshot = await reference.get();
    return snapshot.data()!;
  }

  Future<Inquiry> removeOne(String id) async {
    final snapshot = await collection.doc(id).get();
    final data = snapshot.data()!;
    await collection.doc(id).delete();
    return data;
  }
}
