import 'package:flutter/material.dart';

import 'package:instagram_clone/ui/screen/home_navigator/home_navigator.dart';
import 'package:instagram_clone/ui/screen/login/login_screen.dart';
import 'package:instagram_clone/ui/storage/secure_storage.dart';

class AuthResolverWidget extends StatefulWidget {
  const AuthResolverWidget({Key? key}) : super(key: key);

  @override
  State<AuthResolverWidget> createState() => _AuthResolverWidgetState();
}

class _AuthResolverWidgetState extends State<AuthResolverWidget> {
  final _secureStorage = SecureStorageData();
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    getUserDetails();
    loginUserInfo();
  }

  Future<String?> getUserDetails() async {
    String? emailId = await _secureStorage.read("Existing_Email_Id");
    if (emailId != null) {
      return emailId;
    } else {
      return null;
    }
  }

  loginUserInfo() async {
    String? userInfo = await getUserDetails();
    if (userInfo != null) {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? const HomeNavigatorScreen() : const LoginScreen();
  }
}
