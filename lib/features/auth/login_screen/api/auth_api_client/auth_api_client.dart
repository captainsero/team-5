class AuthApiClient {

  Future<Map<String, dynamic>> login(String email, String password) async {

    await Future.delayed(const Duration(seconds: 1));

    return {
      "id": 1,
      "name": "mohamed",
      "email": email,
      "token": "123456789"
    };
  }

}