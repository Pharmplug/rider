class Tracker {
   String name;
  final String addressFrom;
  final String addressTo;
  final String time;
  final bool isOnTransit;
  final String noOfItems;
  final String distance;
  final String status;

  Tracker({
   required this.name,
      required this.isOnTransit,
      required this.addressFrom,
      required this.addressTo,
      required this.time,
      required this.noOfItems,
      required this.distance,
      required this.status,
  });
}