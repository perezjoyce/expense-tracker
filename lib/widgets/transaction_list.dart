import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView(
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
      ),
    );
  }
}
