import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  const Storage._();

  static final ref = FirebaseStorage.instance.ref();

  static Future<String> urlFromPath(String path) async {
    return ref.child(path).getDownloadURL();
  }

  static void uploadImage({
    required String newPath,
    required File image,
  }) {
    final newRef = ref.child(newPath);
    newRef.putFile(image);
  }

  static Future<void> deleteFile(String path) async {
    final fileRef = ref.child(path);
    return fileRef.delete();
  }
}
