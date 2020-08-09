import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, //Parent sets the height of list view
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              title: Text(
                transactions[index].title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
              subtitle: Text(
                DateFormat('MMM dd, yyyy').format(transactions[index].date),
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
                  '\$${transactions[index].amount.toStringAsFixed(2)}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
