class UserModel {
  String id;
  String email;
  String name;
  String? image;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.image,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'image': image,
      };

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      image: json['image'],
    );
  }
}
