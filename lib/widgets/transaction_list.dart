import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'mcbook pro',
      amount: 150000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'mechanical keyboard mechanical keyboard mechanical keyboard mechanical keyboardmechanical keyboardmechanical keyboardmechanical keyboardmechanical keyboardmechanical keyboard',
      amount: 3456.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'weekly groceries',
      amount: 1450.25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'house bill',
      amount: 1100,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'electricity bill',
      amount: 8000.80,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((transaction) {
        return Card(
          child: ListTile(
            title: Text(
              transaction.title,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              DateFormat('MMM dd, yyyy').format(transaction.date),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            leading: Container(
              padding: EdgeInsets.symmetric(
                vertical: 15,
              ),
              width: 100,
              child: Text(
                '\$${transaction.amount}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
