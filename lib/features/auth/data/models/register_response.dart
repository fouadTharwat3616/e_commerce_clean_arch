import 'user_model.dart';

class RegisterResponse {
  final String? message;
  final UserModel? user;
  final String? token;

  const RegisterResponse({
    this.message,
    this.user,
    this.token,
  });

  @override
  String toString() {
    return 'RegisterResponse(message: $message, user: $user, token: $token)';
  }

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }
}
