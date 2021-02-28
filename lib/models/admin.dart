class Admin {
  String token;
  String message;
  bool success;
  Map<String, dynamic> admin;

  Admin({this.token, this.message, this.success, this.admin});

  factory Admin.fromJson(Map<String, dynamic> json){
    return Admin(
      token: json['token'],
      message: json['message'],
      success: json['success'],
      admin: json['admin']
    );
  }
}
