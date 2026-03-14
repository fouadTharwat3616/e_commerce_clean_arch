import 'package:ecommerce/features/auth/data/models/user_model.dart';

class LoginResponse {
  final String? message;
  final UserModel? user;
  final String? token;

  const LoginResponse({
    this.message,
    this.user,
    this.token,
  });

  @override
  String toString() {
    return 'LoginResponse(message: $message, user: $user, token: $token)';
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : UserModel.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
      );
}
