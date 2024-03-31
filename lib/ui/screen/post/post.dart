import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _textEditController = TextEditingController();
  File? file;

  Future<void> selectImage() async {
    final pick = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      if (pick != null) {
        file = File(pick.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
          child: Column(
            children: [
              //row for user profile image and user name
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
                    onTap: () {
                      print("yes");
                    },
                    child: const Text(
                      "Post",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              ),
              //row for description
              Row(
                children: [
                  Expanded(
                    child: TextField(
                        controller: _textEditController,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: "Write your description",
                          border: InputBorder.none,
                        )),
                  )
                ],
              ),
              Container(
                child: Image.network(
                  "https://1.bp.blogspot.com/-jDiadpEcRDw/WmyIav9vpnI/AAAAAAAA1Ww/qeF9kEbDELEKREp6w7HbjvEwY-DrpNr0ACLcBGAs/s1600/Telugu%2BActress%2BSai%2BPallavi%2BOily%2BFace%2BCloseup%2BSmiling%2BStills%2B%25288%2529.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //row for select image form gallery or camera
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  SizedBox(
                    child: Icon(Icons.camera_alt),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    child: Icon(Icons.photo),
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
