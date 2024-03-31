import 'package:flutter/material.dart';
import 'package:instagram_clone/services/firebase_setup.dart';
import 'package:instagram_clone/ui/components/common/text_field_widget.dart';
import 'package:instagram_clone/ui/screen/login/login_screen.dart';

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

  @override
  void dispose() {
    _emailController;
    _passwordController;
    _userNameContaoller;
    _mobileNumberController;
    super.dispose();
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
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.zoomtventertainment.com/33345220_793593627517145_3626209380132716544_n_1585625940__rend_9_16.jpg?tr=w-600"),
              radius: 30,
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
              ischeckPassword: true,
            ),
            //some space
            const SizedBox(
              height: 20,
            ),

            //register button
            InkWell(
              onTap: () {
                AuthSetUp().signUpUserDetails(
                    emailId: _emailController.text,
                    password: _passwordController.text,
                    userName: _userNameContaoller.text,
                    mobileNumber: _mobileNumberController.text,
                    bio: "Junior Flutter Dev");

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
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
