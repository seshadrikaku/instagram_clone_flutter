import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        leading: null,
        title: const Row(
          children: [
            Text(
              "Instagram",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Icon(
              Icons.favorite_border_rounded,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.notifications,
              color: Colors.white,
            )
          ],
        ));
  }
}
