class DashboardData {
  final String name;
  final String amount;
  final bool isOnline;

  DashboardData({
    required this.name,
    required this.amount,
    required this.isOnline,
  });

  factory DashboardData.fromJson(Map<String, dynamic> json){
   return DashboardData(
    name: json['name'], 
    amount: json['amount'], 
    isOnline: json['isOnline']
    );
}
}

