import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:pharmplug_rider/models/track_orders.dart';
import 'package:pharmplug_rider/views/order/order_tracker.dart';
import 'package:pharmplug_rider/views/order/oder_details/order_details.dart';

import '../models/recent_deliveries.dart';
import 'app_images.dart';

NumberFormat formatter = NumberFormat.decimalPatternDigits(
  locale: 'en_us',
  decimalDigits: 1,
);

String baseURL =dotenv.env['BASE_URL']!;


String getCurrency() {
  return '₦'; // Unicode character for Naira symbol
}

String apiKey = dotenv.env['API_KEY']!; 

final List<Order> orders = [
  Order(
    img: AppImages.box,
    name: "Julie Harrisson Pharmacy Store",
    id: "FI56H17",
    amount: "0000",
    completed: true,
  ),
  Order(
img: AppImages.box,
    name: "Julie Harrisson Pharmacy Store",
    id: "FI56H17",
    amount: "9000",
    completed: false,
    
  ),
  Order(
    img: AppImages.logo,
    name: "Paul & Gina Pharmacy",
    id: "FI56H17",
    amount: "0000",
    completed: true,
  ),
  Order(
    img: AppImages.logo,
    name: "Julie Harrisson Pharmacy Store",
    id: "FI56H17",
    amount: "0000",
    completed: true,
  ),
  Order(
    img: AppImages.logo,
    name: "Julie Harrisson Pharmacy Store",
    id: "FI56H17",
    amount: "0000",
    completed: true,
  ),
];

final List<Tracker> trackers = [
  Tracker(
    name: "Julie Harrisson Pharmacy Store",
    addressFrom: "20, Ligali Ayorinde, Ikoyi, Lagos.",
    addressTo: "11, Mike Adenuga, Ikate, Lekki, Lagos.",
    time: "10:20AM",
    isOnTransit: true,
    noOfItems: '2',
    distance: '2.1km',
    status: ''
  ),
 Tracker(
    name: "Julie Harrisson Pharmacy Store",
    addressFrom: "20, Ligali Ayorinde, Ikoyi, Lagos.",
    addressTo: "11, Mike Adenuga, Ikate, Lekki, Lagos.",
    time: "10:12AM",
    isOnTransit: true,
    noOfItems: '4',
    distance: '2km',
    status: 'Delivered'
  ),
 Tracker(
    name: "Julie Harrisson Pharmacy Store",
    addressFrom: "20, Ligali Ayorinde, Ikoyi, Lagos.",
    addressTo: "11, Mike Adenuga, Ikate, Lekki, Lagos.",
    time: "10:12AM",
    isOnTransit: true,
    noOfItems: '2',
    distance: '4.1km',
    status: 'On Transit'
  ),
  Tracker(
    name: "Julie Harrisson Pharmacy Store",
    addressFrom: "20, Ligali Ayorinde, Ikoyi, Lagos.",
    addressTo: "11, Mike Adenuga, Ikate, Lekki, Lagos.",
    time: "10:12AM",
    isOnTransit: true,
    noOfItems: '3',
    distance: '2.1km',
    status: 'At The Store'
  ),
  Tracker(
    name: "Julie Harrisson Pharmacy Store",
    addressFrom: "20, Ligali Ayorinde, Ikoyi, Lagos.",
    addressTo: "11, Mike Adenuga, Ikate, Lekki, Lagos.",
    time: "10:12AM",
    isOnTransit: true,
    noOfItems: '2',
    distance: '2.1km',
    status: 'To Pickup'
  ),
   Tracker(
    name: "Julie Harrisson Pharmacy Store",
    addressFrom: "20, Ligali Ayorinde, Ikoyi, Lagos.",
    addressTo: "11, Mike Adenuga, Ikate, Lekki, Lagos.",
    time: "10:12AM",
    isOnTransit: true,
    noOfItems: '2',
    distance: '2.1km',
    status: 'Accepted'
  ),
];

final List<OrderItem> items = [
      OrderItem(name: 'Covid-24 Vaccine', quantity: '2 pcs'),
      OrderItem(name: 'Antibiotics', quantity: '5 pcs'),
      OrderItem(name: 'Painkillers', quantity: '10 pcs'),
    ];