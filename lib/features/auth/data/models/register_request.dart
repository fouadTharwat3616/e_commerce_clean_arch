class RegisterRequest {
  final String name;
  final String phone;
  final String email;
  final String password;

  const RegisterRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'rePassword': password,
      };
}
