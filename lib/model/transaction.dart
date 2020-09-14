import 'package:flutter/foundation.dart';

class Transaction {
  double price;
  String title;
  DateTime date;
  Transaction(
      {@required this.price, @required this.title, @required this.date});
}
