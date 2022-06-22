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
    return await _profileList.doc(uid).set({'name': name, 'gender' : gender, 'score': score});
  }

  Future fetchUsersData() async{
    try{

    }catch(e){
      Logger().i("FetchUsersData ${e.toString()}");
    }
  }
}
