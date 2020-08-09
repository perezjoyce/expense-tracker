import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500, //Parent sets the height of list view
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      transactions[index].title,
                      overflow: TextOverflow.ellipsis,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.title,
                      // style: TextStyle(
                      //   color: Colors.black87,
                      // ),
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
                        vertical: 10,
                      ),
                      width: 120,
                      child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(2)}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 18,
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
