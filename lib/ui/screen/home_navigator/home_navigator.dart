import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/components/common/appBar/appbar.dart';
import 'package:instagram_clone/ui/components/common/bottomnavigation/bottom_navigation.dart';
import 'package:instagram_clone/ui/screen/home/home_screen.dart';
import 'package:instagram_clone/ui/screen/post/post.dart';
import 'package:instagram_clone/ui/screen/profile/profile.dart';
import 'package:instagram_clone/ui/screen/reelstore.dart/reelstore.dart';
import 'package:instagram_clone/ui/screen/search/search.dart';

class HomeNavigatorScreen extends StatefulWidget {
  const HomeNavigatorScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeNavigatorScreen> createState() => _HomeNavigatorScreenState();
}

class _HomeNavigatorScreenState extends State<HomeNavigatorScreen> {
  int currentIndex = 0;

//onTap function
  void handleNavigators(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List screens = [
    const HomeScreen(),
    const SearchScreen(),
    const PostScreen(),
    const ReelStoreScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      appBar: currentIndex == 2 || currentIndex == 4 || currentIndex == 1
          ? null
          : const CommonAppBar(),
      body: screens[currentIndex],
      bottomNavigationBar: CommonBottomNavigation(
          currentIndex: currentIndex,
          onTap: (index) => handleNavigators(index)),
    );
  }
}
