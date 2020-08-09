import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './class/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'mcbook pro',
      amount: 150000,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'mechanical keyboard',
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
    Transaction(
      id: ' t6',
      title: 'water bill',
      amount: 456.11,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't7',
      title: 'kid\s schooling',
      amount: 30000,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Text('Charat'),
          ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        '\$${transaction.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transaction.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          DateFormat('MMM dd, yyyy').format(transaction.date),
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
