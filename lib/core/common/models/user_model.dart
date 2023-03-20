class UserModel {
  String id;
  String email;
  String name;
  String? image;
  String? alternateEmail;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.image,
    this.alternateEmail,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'image': image,
        'alternateEmail': alternateEmail,
      };

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      image: json['image'],
      alternateEmail: json['alternateEmail'],
    );
  }
}
