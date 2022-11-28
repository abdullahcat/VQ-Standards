// ignore_for_file: non_constant_identifier_names, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // CollectionReference

  final CollectionReference UserCollection =
      FirebaseFirestore.instance.collection("Users");

  //New User Data
  Future updateUserData(String Name, String Bio) async {
    return await UserCollection.doc(uid).set({
      "Bio": Bio,
      "Name": Name,
    });
  }
}
