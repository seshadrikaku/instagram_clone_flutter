import 'package:cloud_firestore/cloud_firestore.dart';

class ClassName {
  //for storing
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // Future<String> managePosts() async {
  //   String res = 'We are facing issue';
  //   try {
  //     await firebaseFirestore.collection('posts').doc();
  //   } catch (error) {
  //     print(error);
  //   }
  // }
}
