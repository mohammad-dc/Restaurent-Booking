class AdminLogin {
  String token;
  String message;
  bool success;
  Map<String, dynamic> admin;

  AdminLogin({this.token, this.message, this.success, this.admin});

  factory AdminLogin.fromJson(Map<String, dynamic> json) {
    return AdminLogin(
        token: json['token'],
        message: json['message'],
        success: json['success'],
        admin: json['admin']);
  }
}
