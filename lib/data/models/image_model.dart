class ImageModel {
  final String id;
  final String result;
  final String image;
  final String uid;
  final DateTime? time;
  ImageModel({
    required this.id,
    required this.time,
    required this.result,
    required this.image,
    required this.uid,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        time: DateTime.fromMillisecondsSinceEpoch(json['time']),
        result: json['result'],
        id: json['id'],
        image: json['image'],
        uid: json['uid'],
      );

  Map<String, dynamic> toJson() => {
    'id':id,
        'time': time?.millisecondsSinceEpoch ?? 0,
        'result': result,
        'image': image,
        'uid': uid,
      };
}
