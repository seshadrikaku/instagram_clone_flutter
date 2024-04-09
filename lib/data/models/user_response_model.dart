class UserResponseModel {
  final String fullName;
  final String mobileNumber;
  final String uid;
  final List followers;
  final List following;
  final String emailId;
  final String profileImageUrl;

  UserResponseModel(
      {required this.profileImageUrl,
      required this.emailId,
      required this.followers,
      required this.following,
      required this.fullName,
      required this.mobileNumber,
      required this.uid});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
        profileImageUrl: json['profileImageUrl'],
        emailId: json['emailId'],
        followers: json['followers'],
        following: json['following'],
        fullName: json['fullName'],
        mobileNumber: json['mobileNumber'],
        uid: json['uid']);
  }
}
