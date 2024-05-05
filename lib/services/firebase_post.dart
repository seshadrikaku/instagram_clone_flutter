import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/data/models/post_response_model.dart';
import 'package:instagram_clone/services/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class ClassName {
  //for storing
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<String> managePosts(
      DateTime postDate,
      int likesCount,
      int commentsCount,
      Uint8List profileImageUrl,
      String userName,
      String userId,
      String content,
      Uint8List imageUrl,
      String uid) async {
    String res = 'We are facing issue';
    try {
      String postId = const Uuid().v1();
      String photoUrl =
          await StorageMethods().uploadImageToStorage("posts", imageUrl, true);
      PostModel postModel = PostModel(
          userName: userName,
          userId: userId,
          imageUrl: photoUrl,
          content: content,
          profileImageUrl: profileImageUrl,
          postDate: DateTime.now(),
          postId: postId,
          likesCount: likesCount,
          commentsCount: commentsCount);

      await firebaseFirestore
          .collection('posts')
          .doc(postId)
          .set(postModel.toJson());

      res = 'success post';
      print(res);
      return res;
    } catch (error) {
      print(error);
    }
    return res;
  }
}
