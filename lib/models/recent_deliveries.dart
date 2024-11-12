// Define your model
class Order {
  final String id;
  final String img;
  final String name;
  final String amount;
  final bool completed;

  Order({
    required this.id,
       required this.img,
    required this.name,
    required this.amount,
    required this.completed,
  });
}