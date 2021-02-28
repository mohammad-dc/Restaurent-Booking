class Admin {
  bool success;
  Map<String, dynamic> admin;
  Admin({this.admin, this.success});

  factory Admin.fromJson(Map<String, dynamic> json){
    return Admin(
      admin: json['admin'],
      success: json['success']
    );
  }
}