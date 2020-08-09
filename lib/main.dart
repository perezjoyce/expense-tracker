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
    // Transaction(
    //   id: ' t6',
    //   title: 'water bill',
    //   amount: 456.11,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't7',
    //   title: 'kid\s schooling',
    //   amount: 30000,
    //   date: DateTime.now(),
    // )
  ];

  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Text('Charat'),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Enter title',
                      labelText: 'Name *',
                    ),
                    autocorrect: true,
                    controller: titleController,
                    // onChanged: (val) { titleInput = val; }
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Enter amount',
                      labelText: 'Amount *',
                    ),
                    autocorrect: true,
                    controller: amountController,
                    // onChanged: (val) { amountInput = val; }
                  ),
                  RaisedButton(
                    color: Colors.indigo,
                    textColor: Colors.white,
                    child: Text('Add entry'),
                    onPressed: () {
                      print(titleController.text);
                    },
                  )
                ],
              ),
            ),
          ),
          Column(
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
        ],
      ),
    );
  }
}
