import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonBottomNavigation extends StatelessWidget {
  int currentIndex;
  final Function(int index) onTap;
  CommonBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.flip_camera_ios_outlined,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: ""),
        ]);
  }
}
