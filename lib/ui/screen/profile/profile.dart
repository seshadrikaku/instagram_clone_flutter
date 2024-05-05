import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/ui/screen/login/login_screen.dart';
import 'package:instagram_clone/ui/storage/secure_storage.dart';
import 'package:instagram_clone/utils/pick_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SecureStorageData _storageData = SecureStorageData();

  Uint8List? profileImage;
//pickImage from gallery
  selectImageFromGallery() async {
    Uint8List image = await SelectImage().pickImage(ImageSource.gallery);
    setState(() {
      profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarForProfile(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            //user image and posts and followers details
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    (profileImage != null)
                        ? CircleAvatar(
                            radius: 40,
                            backgroundImage: MemoryImage(profileImage!),
                          )
                        : const CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              "https://1.bp.blogspot.com/-jDiadpEcRDw/WmyIav9vpnI/AAAAAAAA1Ww/qeF9kEbDELEKREp6w7HbjvEwY-DrpNr0ACLcBGAs/s1600/Telugu%2BActress%2BSai%2BPallavi%2BOily%2BFace%2BCloseup%2BSmiling%2BStills%2B%25288%2529.jpg",
                            ),
                          ),
                    Positioned(
                      bottom: -5,
                      right: -5,
                      child: InkWell(
                        onTap: selectImageFromGallery,
                        child: const Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Row(
                      children: [Text("5")],
                    ),
                    Row(
                      children: [Text("posts")],
                    )
                  ],
                ),
                const Column(
                  children: [
                    Row(
                      children: [Text("533k")],
                    ),
                    Row(
                      children: [Text("follwers")],
                    )
                  ],
                ),
                const Column(
                  children: [
                    Row(
                      children: [Text("1674")],
                    ),
                    Row(
                      children: [Text("following")],
                    )
                  ],
                )
              ],
            )
            //name
            ,
            const Row(
              children: [
                Text("Seshadri kaku"),
              ],
            ),
            // bio
            const Row(
              children: [
                Flexible(
                  child: Text(
                      "Flutter Developer, I Can Build real time user friendly apps for Android and Ios... "),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromRGBO(44, 42, 42, 1),
              ),
              child: GestureDetector(
                  onTap: () {}, child: const Text("Edit profile")),
            ),

            const SizedBox(
              height: 200,
            ),
            TextButton(
                onPressed: () {
                  _storageData.clear("Existing_Email_Id");
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false);
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }

  //Widget for appBar
  PreferredSizeWidget _buildAppBarForProfile(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      title: const Row(
        children: [
          Icon(Icons.lock_rounded),
          SizedBox(
            width: 10,
          ),
          Text('user_Name'),
          Spacer(),
          Icon(Icons.menu),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
