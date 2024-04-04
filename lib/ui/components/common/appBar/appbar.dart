import 'package:flutter/material.dart';
import 'package:instagram_clone/ui/screen/chat/chat_screen.dart';

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
        title: Row(
          children: [
            const Text(
              "Instagram",
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            const Icon(
              Icons.favorite_border_rounded,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.chat,
                color: Colors.white,
              ),
            )
          ],
        ));
  }
}
