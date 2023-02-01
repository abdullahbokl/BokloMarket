class UserModel {
  String uid;
  String email;
  String name;
  String? image;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
        'name': name,
        'image': image,
      };

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      name: json['name'],
      image: json['image'],
    );
  }
}
