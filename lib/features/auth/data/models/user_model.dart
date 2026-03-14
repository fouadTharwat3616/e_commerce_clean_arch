import 'package:ecommerce/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.name, required super.email});

  @override
  String toString() => 'User(name: $name, email: $email)';

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
      );
}
