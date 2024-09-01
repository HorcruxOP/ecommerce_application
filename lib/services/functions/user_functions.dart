import 'package:cloud_firestore/cloud_firestore.dart';

class UserFunctions {
  static void createUserDetails(
      String email, String password, String fullName, String userId) async {
    try {
      FirebaseFirestore.instance.collection("users").doc(userId).set({
        "userId": userId,
        "email": email,
        "password": password,
        "fullName": fullName
      });
    } catch (e) {
      rethrow;
    }
  }
}
