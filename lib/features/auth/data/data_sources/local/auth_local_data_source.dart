abstract class AuthLocalDataSource {

  Future<void> saveToken(String token);
  String getToken();

  Future<void> saveName(String name);
  String getName();

  Future<void> saveEmail(String email);
  String getEmail();

}
