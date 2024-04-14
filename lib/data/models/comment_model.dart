class CommentModel {
  final String ?userName;
  final String ?userImage;
  final String ?uid;
  final DateTime ?time;
  final String ?commentId;
  final String ?comment;
  final List<dynamic>?likes;
  CommentModel( {
    required this.commentId,
    required this.comment,
    required this.userName,
    required this.time,
    required this.userImage,
    required this.uid,
    required this.likes,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
      userName: json['userName'],
      time: DateTime.fromMillisecondsSinceEpoch(json['time']),
      userImage: json['userImage'],
      uid: json['uid'],
      comment: json['post'],
      likes: json['likes'],
      commentId: json['postId'],
  );

  Map<String, dynamic> toJson() => {
    'userName': userName??"person",
    'post': comment??"",
    'time': time?.millisecondsSinceEpoch??0,
    'userImage': userImage??"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
    'uid': uid??"",
    'likes':likes??[],
    'postId':commentId??"",
  };
}
