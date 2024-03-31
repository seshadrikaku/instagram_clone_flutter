import 'package:flutter/material.dart';
import 'package:instagram_clone/services/firebase_setup.dart';
import 'package:instagram_clone/ui/components/common/text_field_widget.dart';
import 'package:instagram_clone/ui/screen/home_navigator/home_navigator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreentState();
}

class _LoginScreentState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController;
    _passwordController;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            //svg image

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
            //password textfiled
            TextFieldsWidget(
              hintText: 'Enter Password',
              keybordTupe: TextInputType.text,
              textEditingController: _passwordController,
              ischeckPassword: true,
            ),
            //some space
            const SizedBox(
              height: 20,
            ),

            //login button
            InkWell(
              onTap: () {
                AuthSetUp().login(
                    emailId: _emailController.text,
                    password: _passwordController.text);

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeNavigatorScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                ),
                child: const Text(
                  "Login",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: const Text("You don't Have an Account.?"),
                ),
                Container(
                  child: const Text(
                    "Sign up.",
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
