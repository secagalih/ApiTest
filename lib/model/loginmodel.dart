class LoginReguest {
  String email;
  String password;

  LoginReguest({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'password': password.trim(),
    };
    return map;
  }
}

class LoginToken {
  final String token;
  final String error;

  LoginToken({
    required this.token,
    required this.error,
  });

  factory LoginToken.fromJson(Map<String, dynamic> oject) {
    return LoginToken(
      token: oject['token'] != null ? oject['token'] : '',
      error: oject['error'] != null ? oject['error'] : '',
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'token': token.trim(),
      'error': error.trim(),
    };
    return map;
  }
}
