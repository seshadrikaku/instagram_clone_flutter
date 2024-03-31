import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSetUp {
//for register
  final FirebaseAuth auth = FirebaseAuth.instance;
  //for storing
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//sign up method
  Future<String> signUpUserDetails(
      {required String emailId,
      required String password,
      required String userName,
      required String mobileNumber,
      required String bio}) async {
    String response = "We are facing some error";
    try {
      if (emailId.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          mobileNumber.isNotEmpty ||
          bio.isNotEmpty) {
        //user register
        UserCredential userDetails = await auth.createUserWithEmailAndPassword(
            email: emailId, password: password);
        print(userDetails.user!.uid); //genarate id

        //Store user related data in firebase database
        await firebaseFirestore
            .collection("instagramCloneUserDetails")
            .doc(userDetails.user!.uid)
            .set({
          "userName": userName,
          "mobileNumber": mobileNumber,
          "bio": bio,
          "uid": userDetails.user!.uid,
          "email": emailId
        });
        response = "Success";
      }
    } catch (e) {
      response = e.toString();
    }
    return response;
  }

  Future<String> login(
      {required String emailId, required String password}) async {
    try {
      if (emailId.isNotEmpty || password.isNotEmpty) {
        print("succesfully logged in");
      }
    } catch (e) {
      print(e);
      return "failed";
    }
    return "";
  }
}
