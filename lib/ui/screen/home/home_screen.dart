import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            _buildUserStatusVideos(),
            Expanded(
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                              "https://images.indianexpress.com/2019/06/sai-pallavi-1.jpg?w=759&h=948&imflag=true",
                            ),
                          ),
                          SizedBox(width: 10),
                          Text("Seshadri"),
                          Spacer(),
                          Icon(Icons.more_vert),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.network(
                          "https://images.indianexpress.com/2019/06/sai-pallavi-1.jpg?w=759&h=948&imflag=true",
                          height: MediaQuery.of(context).size.height / 2,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border_rounded),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.comment_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.send),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for user status videos
  Widget _buildUserStatusVideos() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(20, (index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                "https://images.indianexpress.com/2019/06/sai-pallavi-1.jpg?w=759&h=948&imflag=true",
              ),
            ),
          );
        }),
      ),
    );
  }
}
