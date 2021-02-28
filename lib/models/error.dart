class Error {
  bool success;
  String message;

  Error({this.success, this.message});

  factory Error.fromJson(Map<String, dynamic> json){
    return Error(
      message: json['message'],
      success: json['success'],
    );
  }
}