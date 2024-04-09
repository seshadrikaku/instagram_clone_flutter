import 'dart:io';

class PostResponseModel {
  final String userId;
  final String userName;
  final File imageUrl;
  final String content;
  final String postDate;
  final String postId;
  final int likesCount;
  final int commentsCount;

  const PostResponseModel({
    required this.userName,
    required this.userId,
    required this.imageUrl,
    required this.content,
    required this.postDate,
    required this.postId,
    required this.likesCount,
    required this.commentsCount,
  });

  static PostResponseModel fromJson(Map<String, dynamic> json) {
    return PostResponseModel(
      userName: json['userName'],
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
