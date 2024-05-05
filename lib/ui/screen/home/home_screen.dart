import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/providers/firebase_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postDetails = ref.watch(postsStreamProvider);
    return Scaffold(
      body: postDetails.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              final doc = data.docs[index];
              return _buildPostWidget(context, doc);
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildPostWidget(BuildContext context, DocumentSnapshot post) {
    final data = post.data() as Map<String, dynamic>;
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            data['imageUrl'] != null
                ? CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(data['imageUrl']),
                  )
                : Container(),
            const SizedBox(width: 10),
            Text(data['userName']),
            const Spacer(),
            const Icon(Icons.more_vert),
          ],
        ),
        GestureDetector(
          // Add your gesture detection logic here
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              data['imageUrl'],
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container();
              },
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              // Add your like button logic here
              onPressed: () {},
              icon: Icon(Icons.favorite_border_rounded),
            ),
            Text(data['likesCount'].toString()),
            const SizedBox(width: 10),
            IconButton(
              // Add your comment button logic here
              onPressed: () {},
              icon: const Icon(Icons.comment_rounded),
            ),
            IconButton(
              // Add your share button logic here
              onPressed: () {},
              icon: const Icon(Icons.send),
            ),
            const Spacer(),
            IconButton(
              // Add your bookmark button logic here
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border),
            ),
          ],
        ),
      ],
    );
  }
}
