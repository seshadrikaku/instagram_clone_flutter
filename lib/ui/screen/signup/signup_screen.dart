import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/services/firebase_auth_setup.dart';
import 'package:instagram_clone/ui/components/common/text_field_widget.dart';
import 'package:instagram_clone/ui/components/common/utils.dart';
import 'package:instagram_clone/ui/screen/login/login_screen.dart';
import 'package:instagram_clone/utils/pick_image.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreentState();
}

class _SignUpScreentState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameContaoller = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  Uint8List? profileImage;

  @override
  void dispose() {
    _emailController;
    _passwordController;
    _userNameContaoller;
    _mobileNumberController;
    super.dispose();
  }

  selectImage() async {
    Uint8List image = await SelectImage().pickImage(ImageSource.gallery);
    setState(() {
      profileImage = image;
    });
  }

  //handle signup
  void handleSignUp() async {
    final response = AuthSetUp().signUpUserDetails(
        emailId: _emailController.text,
        password: _passwordController.text,
        userName: _userNameContaoller.text,
        mobileNumber: _mobileNumberController.text,
        bio: "Junior Flutter Dev",
        imageFile: profileImage!);
    // ignore: unrelated_type_equality_checks

    if (response == "success") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      showSnackBar("Sorry unable to signIn", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Stack(
              children: [
                profileImage != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(profileImage!),
                        backgroundColor: Colors.red,
                      )
                    : const CircleAvatar(
                        radius: 64,
                        backgroundImage:
                            NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                        backgroundColor: Colors.red,
                      ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                )
              ],
            ),
            //some space
            Flexible(
              flex: 2,
              child: Container(),
            ),
            //email textfiled
            TextFieldsWidget(
              hintText: 'Enter Email Id',
              keybordTupe: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            TextFieldsWidget(
              hintText: 'Enter UserName',
              keybordTupe: TextInputType.text,
              textEditingController: _userNameContaoller,
            ),
            //password textfiled
            TextFieldsWidget(
              hintText: 'Enter Password',
              keybordTupe: TextInputType.text,
              textEditingController: _passwordController,
              ischeckPassword: true,
            ),
            TextFieldsWidget(
              hintText: 'Mobile number',
              keybordTupe: TextInputType.text,
              textEditingController: _mobileNumberController,
            ),
            //some space
            const SizedBox(
              height: 20,
            ),

            //register button
            InkWell(
              onTap: handleSignUp,
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[300],
                ),
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //some space

            Flexible(
              flex: 2,
              child: Container(),
            ),
            //navigation
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text("All ready you have an Account.?"),
                ),
                SizedBox(
                  child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
