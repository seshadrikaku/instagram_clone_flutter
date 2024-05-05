import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseProvider = FutureProvider<FirebaseApp>((ref) async {
  final FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
});

final postsStreamProvider = StreamProvider<QuerySnapshot>((ref) {
  return FirebaseFirestore.instance.collection('posts').snapshots();
});
