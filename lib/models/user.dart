class User {
  String token;
  String message;
  bool success;
  Map<String, dynamic> user;
  List<dynamic> users;

  User({this.token, this.message, this.success, this.user, this.users});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      token: json['token'],
      message: json['message'],
      success: json['success'],
      user: json['user'],
      users: json['users']
    );
  }
}
