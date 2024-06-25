class UserModel {
  final String name;
  final String email;
  final String password;
  final String image;
  final String header;
  final String uid;
  final String phoneNumber;
  UserModel({
    required this.phoneNumber,
    required this.name,
    required this.email,
    required this.password,
    required this.image,
    required this.uid,
    required this.header
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      image: json['image'],
      uid: json['uid'], phoneNumber: json['phoneNumber'],header: json['header']);

  Map<String, dynamic> toJson() => {
    'phoneNumber':phoneNumber,
        'name': name,
        'email': email,
        'password': password,
        'image': image,
        'uid': uid,
    'header':header
      };
}
