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
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    'assets/images/savings.gif',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'No expenses yet. Way to go!',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title,
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    // leading: CircleAvatar(
                    //   radius: 30,
                    //   child: Text('test'),
                    // ),
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
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
