import 'dart:typed_data';

class PostModel {
  final String userId;
  final String userName;
  final String imageUrl;
  final Uint8List profileImageUrl;

  final String content;
  final DateTime postDate;
  final String postId;
  final int likesCount;
  final int commentsCount;

  const PostModel({
    required this.userName,
    required this.profileImageUrl,
    required this.userId,
    required this.imageUrl,
    required this.content,
    required this.postDate,
    required this.postId,
    required this.likesCount,
    required this.commentsCount,
  });
  Map<String, dynamic> toJson() => {
        "profileImageUrl": profileImageUrl,
        "userName": userName,
        "userId": userId,
        "imageUrl": imageUrl,
        "content": content,
        "postDate": postDate,
        "postId": postId,
        "likesCount": likesCount,
        "commentsCount": commentsCount,
      };

  static PostModel fromJson(Map<String, dynamic> json) {
    return PostModel(
      userName: json['userName'],
      profileImageUrl: json['profileImageUrl'],
      userId: json['userId'],
      imageUrl: json['imageUrl'],
      content: json['content'],
      postDate: json['postDate'],
      postId: json['postId'],
      likesCount: json['likesCount'],
      commentsCount: json['commentsCount'],
    );
  }
}
