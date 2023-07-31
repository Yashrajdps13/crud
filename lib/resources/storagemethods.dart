import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class StorageMethods{
  final FirebaseStorage _storage=FirebaseStorage.instance;
  Future<String> uploadImageToStorage(String childName, Uint8List file, bool isPost, String name) async {
    Reference ref=_storage.ref().child(childName).child(name);

    UploadTask uploadTask=ref.putData(file);
    TaskSnapshot snap=await uploadTask;
    String downloadUrl= await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}