class MenuFood{
  String message;
  bool success;
  Map<String, dynamic> menuFood;
  List<Map<String, dynamic>> menu;

  MenuFood({this.message, this.success, this.menuFood, this.menu});

  factory MenuFood.fromJson(Map<String, dynamic> json){
    return MenuFood(
      menuFood: json['menuFood'],
      menu: json['menu'],
      message: json['message'],
      success: json['success']
    );
  }
}