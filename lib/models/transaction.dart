// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

class Transaction {
  String id;
  String title;
  double amount;
  DateTime date;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
