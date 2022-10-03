import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class DatabaseManager {
  final CollectionReference _profileList =
      FirebaseFirestore.instance.collection("profileInfo");

  // When using document reference
  final DocumentReference _documentReference =
      FirebaseFirestore.instance.collection('profileInfo').doc();

  Future<void> createUserData(
      String name, String gender, int score, String uid) async {
    return await _profileList
        .doc(uid)
        .set({'name': name, 'gender': gender, 'score': score});
  }

  Future fetchUsersData() async {
    List _usersDataList = [];

    try {
      await _profileList.get().then((querySnapshot) {
        //_usersDataList = querySnapshot.docs.map((e) {}).toList();

        for (var element in querySnapshot.docs) {
          _usersDataList.add(element);
        }
      });

      return _usersDataList;
    } catch (e) {
      Logger().i("FetchUsersData ${e.toString()}");
      return e;
    }
  }
}
