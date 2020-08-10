import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;

  Chart(this.transactions);

  //GETTER: Get a map with the weeks and their corresponding total expenses
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(
        Duration(days: index),
      );
      var total = 0.0;

      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekday.day && transactions[i].date.month == weekday.month && transactions[i].date.year == weekday.year) {
          total += transactions[i].amount;
        }
      }

      print(total);
      print(DateFormat.E().format(weekday));

      return {
        'day': DateFormat.E().format(weekday).substring(0, 1),
        'amount': total,
      };
    });
  }

  //Get spendingPercentageOfTotal for chart bar usng fold which is equivalent t reduced fuction in js
  double get totalExpense {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          return ChartBar(
            data['day'],
            data['amount'],
            totalExpense == 0.0 ? 0.0 : (data['amount'] as double) / totalExpense,
          );
        }).toList(),
      ),
    );
  }
}
