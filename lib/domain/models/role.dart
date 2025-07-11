class Role {
  final String id;
  final String name;
  final String? image;
  final String route;

  Role({required this.id, required this.name, this.image, required this.route});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      route: json['route'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'route': route,
  };
}
