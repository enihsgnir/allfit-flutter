import 'package:allfit_flutter/domains/tailor/tailor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TailorRepository {
  final collection =
      FirebaseFirestore.instance.collection("tailor").withConverter<Tailor>(
            fromFirestore: (snapshot, _) => Tailor.fromJson(snapshot.data()!),
            toFirestore: (value, _) => value.toJson(),
          );
}
