import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  const Storage._();

  static final ref = FirebaseStorage.instance.ref();

  static Future<String> urlFromPath(String path) async {
    return ref.child(path).getDownloadURL();
  }
}
