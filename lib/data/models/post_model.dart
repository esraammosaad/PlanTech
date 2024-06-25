class PostModel {
  final String ?userName;
  final String ?userImage;
  final String ?uid;
  final DateTime ?time;
  final String ?postId;
  final String ?post;
  final String ?postType;
  final String ?fileUrl;
  final List<dynamic>?likes;
  PostModel( {
    required this.postType,required this.fileUrl,required this.likes,
    required this.postId,
    required this.post,
    required this.userName,
    required this.time,
    required this.userImage,
    required this.uid,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userName: json['userName'],
        time: DateTime.fromMillisecondsSinceEpoch(json['time']),
        userImage: json['userImage'],
        uid: json['uid'],
        post: json['post'],
    fileUrl: json['fileId'],
    likes: json['likes'],
    postId: json['postId'],
    postType: json['postType']
      );

  Map<String, dynamic> toJson() => {
        'userName': userName??"",
        'post': post??"",
        'time': time?.millisecondsSinceEpoch??0,
        'userImage': userImage??"",
        'uid': uid??"",
    'fileId':fileUrl??"",
    'likes':likes??[],
    'postId':postId??"",
    'postType':postType??"",
      };
}
