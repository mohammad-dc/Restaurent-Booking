class Admin {
  bool success;
  String message;
  Map<String, dynamic> admin;
  Admin({this.admin, this.message, this.success});

  factory Admin.fromJson(Map<String, dynamic> json){
    return Admin(
      admin: json['admin'],
      message: json['message'],
      success: json['success']
    );
  }
}