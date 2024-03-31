import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBarForProfile(context),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          children: [
            //user image and posts and followers details
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://1.bp.blogspot.com/-jDiadpEcRDw/WmyIav9vpnI/AAAAAAAA1Ww/qeF9kEbDELEKREp6w7HbjvEwY-DrpNr0ACLcBGAs/s1600/Telugu%2BActress%2BSai%2BPallavi%2BOily%2BFace%2BCloseup%2BSmiling%2BStills%2B%25288%2529.jpg",
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [Text("5")],
                    ),
                    Row(
                      children: [Text("posts")],
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [Text("533k")],
                    ),
                    Row(
                      children: [Text("follwers")],
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [Text("1674")],
                    ),
                    Row(
                      children: [Text("following")],
                    )
                  ],
                )
              ],
            )
            //name
            ,
            const Row(
              children: [
                Text("Seshadri kaku"),
              ],
            ),
            // bio
            const Row(
              children: [
                Flexible(
                  child: Text(
                      "Flutter Developer, I Can Build real time user friendly apps for Android and Ios... "),
                ),
              ],
            ),
            //Edit profile.
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color.fromRGBO(44, 42, 42, 1),
              ),
              child: GestureDetector(
                  onTap: () {}, child: const Text("Edit profile")),
            )
          ],
        ),
      ),
    );
  }

  //Widget for appBar
  PreferredSizeWidget _buildAppBarForProfile(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      title: const Row(
        children: [
          Icon(Icons.lock_rounded),
          SizedBox(
            width: 10,
          ),
          Text('user_Name'),
          Spacer(),
          Icon(Icons.menu),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
