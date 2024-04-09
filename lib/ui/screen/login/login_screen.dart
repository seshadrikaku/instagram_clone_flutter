import 'package:flutter/material.dart';
import 'package:instagram_clone/services/firebase_auth_setup.dart';
import 'package:instagram_clone/ui/components/common/text_field_widget.dart';
import 'package:instagram_clone/ui/components/common/utils.dart';
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
  bool isLoggedIn = false;
  @override
  void dispose() {
    _emailController;
    _passwordController;

    super.dispose();
  }

  //login user
  void handleLoginUser(context) async {
    setState(() {
      isLoggedIn = true;
    });
    String response = await AuthSetUp().login(
        emailId: _emailController.text, password: _passwordController.text);
    if (response == 'sucess') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeNavigatorScreen(),
        ),
        (route) => false,
      );
    } else {
      showSnackBar(response, context);
    }
    setState(() {
      isLoggedIn = false;
    });
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
              height: 40,
            ),

            //login button
            InkWell(
              onTap: () => handleLoginUser(context),
              child: Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                ),
                child: isLoggedIn
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      )
                    : const Text(
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
