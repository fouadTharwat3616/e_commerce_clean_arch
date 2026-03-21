import 'package:ecommerce/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.name, required super.email,super.phone,super.password
    });


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String?,
        password: json['password'] as String?
      );
}
