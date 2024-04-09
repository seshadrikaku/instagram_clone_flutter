import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/constants/storage_text.dart';
import 'package:instagram_clone/services/firebase_storage.dart';
import 'package:instagram_clone/ui/storage/secure_storage.dart';

class AuthSetUp {
//for register
  final FirebaseAuth auth = FirebaseAuth.instance;
  //for storing
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final _secureStorage = SecureStorageData();

//sign up method
  Future<String> signUpUserDetails(
      {required String emailId,
      required String password,
      required String userName,
      required String mobileNumber,
      required Uint8List imageFile,
      required String bio}) async {
    String response = "We are facing some error";
    try {
      if (emailId.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          mobileNumber.isNotEmpty ||
          bio.isNotEmpty ||
          imageFile != null) {
        //user register
        UserCredential userDetails = await auth.createUserWithEmailAndPassword(
            email: emailId, password: password);
        print(userDetails.user!.uid); //genarate id

        String imageUrl = await StorageMethods()
            .uploadImageToStorage("profileImages", imageFile, false);

        //Store user related data in firebase database
        await firebaseFirestore
            .collection("instagramCloneUserDetails")
            .doc(userDetails.user!.uid)
            .set({
          "userName": userName,
          "mobileNumber": mobileNumber,
          "bio": bio,
          "uid": userDetails.user!.uid,
          "email": emailId,
          "profileURL": imageUrl,
          "followers": [],
          "following": []
        });
        response = "success";
      }
    } catch (e) {
      response = e.toString();
    }
    return response;
  }

  Future<String> login(
      {required String emailId, required String password}) async {
    String response = "something went wrong";
    try {
      if (emailId.isNotEmpty || password.isNotEmpty) {
        await auth.signInWithEmailAndPassword(
            email: emailId, password: password);
        // await _secureStorage.save(userData, emailId);
        response = 'sucess';
      } else {
        response = 'please enter emailid and password';
      }
    } catch (e) {
      return response = e.toString();
    }
    return response;
  }
}
