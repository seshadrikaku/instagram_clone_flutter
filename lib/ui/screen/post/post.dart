import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/ui/screen/home/home_screen.dart';
import 'package:instagram_clone/ui/screen/home_navigator/home_navigator.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _textEditController = TextEditingController();
  XFile? file;

//upload post with some data
  Future<void> uploadPost(
    String userId,
    String userName,
    File imageFile,
    String content,
  ) async {
    try {
      String imageUrl = await _uploadImage(imageFile);
      await FirebaseFirestore.instance.collection("posts").add({
        'userId': userId,
        'userName': userName,
        'imageUrl': imageUrl,
        'content': content,
        'postDate': DateTime.now(),
        'likesCount': 0,
        'commentsCount': 0,
      });
    } catch (error) {
      throw Exception(error);
    }
  }

//UploadImage in Firebase
  Future<String> _uploadImage(File imageFile) async {
    try {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("postImages")
          .child('image_${DateTime.now().millisecondsSinceEpoch}.jpg');
      await ref.putFile(imageFile);
      String getImageUrl = await ref.getDownloadURL();
      return getImageUrl;
    } catch (e) {
      print('Error uploading image: $e');
      throw Exception(e);
    }
  }

  // Pick image from camera
  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    try {
      final XFile? pickImage =
          await picker.pickImage(source: ImageSource.camera);
      setState(() {
        file = pickImage;
      });
    } catch (e) {
      print(e);
    }
  }

  // Pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    try {
      final XFile? pickImage =
          await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        file = pickImage;
      });
    } catch (e) {
      print(e);
    }
  }

  final int userId = DateTime.now().millisecondsSinceEpoch;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
          child: Column(
            children: [
              // Row for user profile image and user name
              Row(
                children: [
                  const CircleAvatar(
                    radius: 23,
                    backgroundImage: NetworkImage(
                        "https://th.bing.com/th/id/OIP.ppmhXBoJnW7ZF1VK-IMJUwHaI2?rs=1&pid=ImgDetMain"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text("UserName"),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      // if (_textEditController.text.isNotEmpty && file != null) {
                      //   await uploadPost(userId.toString(), "Seshadri",
                      //       File(file!.path), _textEditController.text);
                      //   // Reset UI after posting
                      //   _textEditController.clear();
                      //   setState(() {
                      //     file = null;
                      //   });
                      // }
                    },
                    child: const Text(
                      "Post",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              // Row for description
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditController,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: "Write your description",
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
              // Display picked image or a placeholder image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: file != null
                    ? Image.file(
                        File(file!.path),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              const SizedBox(
                height: 20,
              ),
              // Row for selecting image from gallery or camera
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(),
                  SizedBox(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const Icon(Icons.camera_alt),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const Icon(Icons.photo),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
