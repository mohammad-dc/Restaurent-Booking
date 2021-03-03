class Order {
  bool success;
  String message;
  Map<String, dynamic> order;
  List<dynamic> orders;
  int count;

  Order({this.message, this.success, this.count, this.order, this.orders});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        order: json['order'],
        orders: json['orders'],
        message: json['message'],
        success: json['success'],
        count: json['count']);
  }
}
