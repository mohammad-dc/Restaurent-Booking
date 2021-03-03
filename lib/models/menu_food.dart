class MenuFood {
  String message;
  bool success;
  Map<String, dynamic> menuFood;
  List<dynamic> menu;
  int count;
  MenuFood({this.message, this.success, this.menuFood, this.menu, this.count});

  factory MenuFood.fromJson(Map<String, dynamic> json) {
    return MenuFood(
        menuFood: json['menuFood'],
        menu: json['menu'],
        message: json['message'],
        success: json['success'],
        count: json['count']);
  }
}
