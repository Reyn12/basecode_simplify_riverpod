class LoginUser {
  const LoginUser({
    required this.id,
    required this.nama,
    required this.email,
    required this.role,
  });

  final int id;
  final String nama;
  final String email;
  final String role;

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: (json['id'] as num).toInt(),
      nama: (json['nama'] ?? json['name']).toString(),
      email: json['email'].toString(),
      role: (json['role'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'role': role,
    };
  }
}

class LoginResult {
  const LoginResult({
    required this.token,
    required this.user,
  });

  final String token;
  final LoginUser user;

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      token: (json['token'] ?? json['access_token'] ?? json['accessToken']).toString(),
      user: LoginUser.fromJson((json['user'] as Map<String, dynamic>).cast<String, dynamic>()),
    );
  }
}

