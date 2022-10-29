import 'dart:async';


import 'package:flutter/material.dart';
import 'package:plant_app/Models/Cart.dart';


class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> plantsToBeShipped;
  final String timing;
  OrderItem({this.id, this.amount, this.plantsToBeShipped, this.timing});
}


