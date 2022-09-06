import 'package:allfit_flutter/models/tailor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TailorRepository {
  final ref = FirebaseFirestore.instance.collection("tailor").withConverter(
        fromFirestore: (snapshot, options) => Tailor.fromJson(snapshot.data()!),
        toFirestore: (value, options) => value.toJson(),
      );
}
