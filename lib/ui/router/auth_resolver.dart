import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/storage_text.dart';
import 'package:instagram_clone/ui/storage/secure_storage.dart';

class AuthResolverWidget extends StatefulWidget {
  const AuthResolverWidget({Key? key}) : super(key: key);

  @override
  State<AuthResolverWidget> createState() => _AuthResolverWidgetState();
}

class _AuthResolverWidgetState extends State<AuthResolverWidget> {
  final _secureStorage = SecureStorageData();
  @override
  void initState() {
    super.initState();
    loginUserInfo();
  }

  Future<String> getUserDetails() async {
    String? userDataJson = await _secureStorage.read(userData);
    final String userEmail = userDataJson!;
    return userEmail;
  }

  loginUserInfo() async {
    Future<String> userInfo = getUserDetails();
    if (userInfo != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
