class User {
  final String name;
  final String email;
  final String? phone;
  final String? password;
  const User({
    required this.name,
    required this.email,
    this.phone,
    this.password
  });
}
