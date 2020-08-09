import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';
import './widgets/transaction_form.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      //we didn't change the pointer (i.e., transactions), just the value/list itself
      transactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          child: TransactionForm(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Text('Charat'),
          ),
          TransactionList(transactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
