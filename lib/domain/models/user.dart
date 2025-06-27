import 'package:indrive_client/domain/models/role.dart';

class User {
  final int? id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String? image;
  final String? password;
  final String? notificationToken;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Role>? roles;

  User({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    this.image,
    this.password,
    this.notificationToken,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastname: json['lastname'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      notificationToken: json['notificationToken'],
      roles:
          (json['roles'] as List)
              .map((roleJson) => Role.fromJson(roleJson))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'lastname': lastname,
    'email': email,
    'phone': phone,
    'image': image,
    'password': password,
    'notificationToken': notificationToken,
    'roles': roles != null ? roles!.map((role) => role.toJson()).toList() : [],
  };
}
