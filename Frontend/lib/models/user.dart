class User {
  final String name;
  final String email;
  final String alamat;

  User({required this.name, required this.email, required this.alamat});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      alamat: json['alamat'],
    );
  }
}
