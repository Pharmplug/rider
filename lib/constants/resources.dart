import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

import '../models/recent_deliveries.dart';
import 'app_images.dart';

NumberFormat formatter = NumberFormat.decimalPatternDigits(
  locale: 'en_us',
  decimalDigits: 1,
);

String baseURL =dotenv.env['BASE_URL']!;

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